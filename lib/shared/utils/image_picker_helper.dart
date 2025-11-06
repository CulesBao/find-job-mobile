import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickFromCamera({
    int maxWidth = 1024,
    int maxHeight = 1024,
    int imageQuality = 85,
  }) async {
    final cameraStatus = await Permission.camera.request();

    if (cameraStatus.isDenied || cameraStatus.isPermanentlyDenied) {
      throw PermissionDeniedException('Camera permission denied');
    }

    if (!cameraStatus.isGranted) {
      return null;
    }

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: maxWidth.toDouble(),
        maxHeight: maxHeight.toDouble(),
        imageQuality: imageQuality,
      );

      if (image == null) return null;

      return File(image.path);
    } catch (e) {
      throw ImagePickException('Failed to capture image: $e');
    }
  }

  static Future<File?> pickFromGallery({
    int maxWidth = 1024,
    int maxHeight = 1024,
    int imageQuality = 85,
  }) async {
    PermissionStatus storageStatus;

    if (Platform.isAndroid) {
      final androidInfo = await _getAndroidVersion();
      if (androidInfo >= 33) {
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

    if (!storageStatus.isGranted && !storageStatus.isLimited) {
      return null;
    }

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth.toDouble(),
        maxHeight: maxHeight.toDouble(),
        imageQuality: imageQuality,
      );

      if (image == null) return null;

      return File(image.path);
    } catch (e) {
      throw ImagePickException('Failed to pick image: $e');
    }
  }

  static Future<bool> openAppSettings() async {
    return await openAppSettings();
  }

  static Future<bool> isCameraPermissionGranted() async {
    return await Permission.camera.isGranted;
  }

  static Future<bool> isGalleryPermissionGranted() async {
    if (Platform.isAndroid) {
      final androidInfo = await _getAndroidVersion();
      if (androidInfo >= 33) {
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

  static Future<int> _getAndroidVersion() async {
    if (!Platform.isAndroid) return 0;

    try {
      await Permission.photos.status;
      return 33;
    } catch (e) {
      return 32;
    }
  }
}

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
