import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class EmployerCard extends StatelessWidget {
  const EmployerCard({super.key, required this.employer});

  final EmployerProfileDto employer;

  @override
  Widget build(BuildContext context) {
    String location;
    if (employer.province != null) {
      if (employer.district != null) {
        location = '${employer.district!.name}, ${employer.province!.name}';
      } else {
        location = employer.province!.name;
      }
    } else {
      location = 'Not specified';
    }
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar/Logo
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
              image: employer.logoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(employer.logoUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: employer.logoUrl == null
                ? const Icon(
                    Icons.business,
                    color: AppColors.primary,
                    size: 32,
                  )
                : null,
          ),
          const SizedBox(width: 16),
          // Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employer.name,
                  style: AppTextStyles.heading3.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                if (employer.about != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 16,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          employer.about!,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textTertiary,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
