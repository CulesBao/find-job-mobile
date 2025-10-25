import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';

class HeaderSection extends StatelessWidget {
  final String name;
  final String location;
  final String biography;
  final VoidCallback onAvatarTap;
  final VoidCallback onBiographyTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onShareTap;

  const HeaderSection({
    super.key,
    required this.name,
    required this.location,
    required this.biography,
    required this.onAvatarTap,
    required this.onBiographyTap,
    required this.onSettingsTap,
    required this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary,
                AppColors.primary.withOpacity(0.8),
                AppColors.primary.withOpacity(0.6),
              ],
            ),
          ),
        ),
        Positioned(
          left: 28,
          top: 43,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 60,
                        color: AppColors.primary,
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(onTap: onAvatarTap),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                name,
                style: AppTextStyles.heading2.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  height: 2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                location,
                style: AppTextStyles.body.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 12),
              if (biography.trim().isEmpty)
                GestureDetector(
                  onTap: onBiographyTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.edit_note_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add Biography',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 250),
                      child: Text(
                        biography.trim(),
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: onBiographyTap,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        Positioned(
          right: 16,
          top: 36,
          child: Row(
            children: [
              IconButton(
                onPressed: onSettingsTap,
                icon: const Icon(Icons.settings, color: Colors.white),
              ),
              IconButton(
                onPressed: onShareTap,
                icon: const Icon(Icons.share, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
