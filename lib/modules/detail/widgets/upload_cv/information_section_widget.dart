import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class InformationSectionWidget extends StatelessWidget {
  final TextEditingController controller;

  const InformationSectionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cover Letter',
            style: AppTextStyles.heading3.copyWith(
              color: const Color(0xFF150B3D),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 232,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
            ),
            child: TextField(
              controller: controller,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              style: AppTextStyles.body.copyWith(
                color: const Color(0xFF150B3D),
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: 'Explain why you are the right person for this job',
                hintStyle: AppTextStyles.body.copyWith(
                  color: const Color(0xFFAAA6B9),
                  fontSize: 12,
                ),
                contentPadding: const EdgeInsets.all(20),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
