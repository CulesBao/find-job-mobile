import 'package:find_job_mobile/modules/setup/widgets/vision_sheet.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class VisionField extends StatelessWidget {
  final TextEditingController controller;

  const VisionField({super.key, required this.controller});

  void _showAddVisionSheet(BuildContext context) {
    VisionSheet.show(context, controller).then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Vision', style: AppTextStyles.label),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _showAddVisionSheet(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.textTertiary.withOpacity(0.3),
              ),
            ),
            child: Text(
              controller.text.isEmpty
                  ? 'Share your company\'s vision'
                  : controller.text,
              style: AppTextStyles.body.copyWith(
                color: controller.text.isEmpty
                    ? AppColors.textSecondary
                    : AppColors.textPrimary,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
