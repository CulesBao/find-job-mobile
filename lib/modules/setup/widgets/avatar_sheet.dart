import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';

class AvatarSheet extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const AvatarSheet({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onCameraTap,
    required VoidCallback onGalleryTap,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          AvatarSheet(onCameraTap: onCameraTap, onGalleryTap: onGalleryTap),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Upload Area
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: AppColors.primary,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  'Upload Photo',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Description text
          Text(
            'Upload photos in JPG or PNG format up to 2 MB.',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 24),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: _ImageSourceButton(
                  icon: Icons.photo_camera_rounded,
                  label: 'Camera',
                  onTap: onCameraTap, // Không pop ở đây, để callback tự xử lý
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ImageSourceButton(
                  icon: Icons.photo_library_rounded,
                  label: 'Gallery',
                  onTap: onGalleryTap, // Không pop ở đây, để callback tự xử lý
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ImageSourceButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ImageSourceButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.textTertiary.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.textPrimary, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
