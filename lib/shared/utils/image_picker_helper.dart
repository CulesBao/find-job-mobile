import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

/// Helper class to pick images safely from camera or gallery.
/// Handles Android/iOS permission differences and avoids app crashes.
class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  /// Pick an image from the camera.
  static Future<File?> pickFromCamera({
    int maxWidth = 1024,
    int maxHeight = 1024,
    int imageQuality = 85,
  }) async {
    try {
      final cameraStatus = await Permission.camera.request();

      if (cameraStatus.isDenied || cameraStatus.isPermanentlyDenied) {
        throw PermissionDeniedException('Camera permission denied');
      }

      if (!cameraStatus.isGranted) return null;

      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: maxWidth.toDouble(),
        maxHeight: maxHeight.toDouble(),
        imageQuality: imageQuality,
      );

      if (image == null) return null;

      final file = File(image.path);
      if (!file.existsSync()) {
        throw ImagePickException('Captured image file not found.');
      }

      return file;
    } catch (e) {
      throw ImagePickException('Failed to capture image: $e');
    }
  }

  /// Pick an image from the gallery.
  static Future<File?> pickFromGallery({
    int maxWidth = 1024,
    int maxHeight = 1024,
    int imageQuality = 85,
  }) async {
    try {
      PermissionStatus storageStatus;

      if (Platform.isAndroid) {
        final androidVersion = await _getAndroidVersion();
        if (androidVersion >= 33) {
          storageStatus = await Permission.photos.request();
        } else {
          storageStatus = await Permission.storage.request();
        }
      } else if (Platform.isIOS) {
        storageStatus = await Permission.photos.request();
      } else {
        storageStatus = await Permission.storage.request();
      }

      if (storageStatus.isDenied || storageStatus.isPermanentlyDenied) {
        throw PermissionDeniedException('Gallery permission denied');
      }

      if (!storageStatus.isGranted && !storageStatus.isLimited) return null;

      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth.toDouble(),
        maxHeight: maxHeight.toDouble(),
        imageQuality: imageQuality,
      );

      if (image == null) return null;

      final file = File(image.path);
      if (!file.existsSync()) {
        throw ImagePickException('Selected image file not found.');
      }

      return file;
    } catch (e) {
      throw ImagePickException('Failed to pick image: $e');
    }
  }

  /// Open the system app settings page.
  static Future<bool> openAppSettingsPage() async {
    return await openAppSettings();
  }

  /// Check camera permission.
  static Future<bool> isCameraPermissionGranted() async {
    return await Permission.camera.isGranted;
  }

  /// Check gallery permission based on platform version.
  static Future<bool> isGalleryPermissionGranted() async {
    if (Platform.isAndroid) {
      final androidVersion = await _getAndroidVersion();
      if (androidVersion >= 33) {
        final status = await Permission.photos.status;
        return status.isGranted || status.isLimited;
      } else {
        return await Permission.storage.isGranted;
      }
    } else if (Platform.isIOS) {
      final status = await Permission.photos.status;
      return status.isGranted || status.isLimited;
    }
    return await Permission.storage.isGranted;
  }

  /// Get Android version (SDK int)
  static Future<int> _getAndroidVersion() async {
    if (!Platform.isAndroid) return 0;
    try {
      final info = await DeviceInfoPlugin().androidInfo;
      return info.version.sdkInt;
    } catch (_) {
      return 32;
    }
  }
}

/// Custom exceptions
class PermissionDeniedException implements Exception {
  final String message;
  PermissionDeniedException(this.message);
  @override
  String toString() => message;
}

class ImagePickException implements Exception {
  final String message;
  ImagePickException(this.message);
  @override
  String toString() => message;
}
