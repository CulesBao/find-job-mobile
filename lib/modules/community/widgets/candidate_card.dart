import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_filter_dto.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CandidateCard extends StatelessWidget {
  const CandidateCard({super.key, required this.candidate});

  final CandidateFilterDto candidate;

  String _getEducationLabel(Education? education) {
    switch (education) {
      case Education.highSchool:
        return 'High School';
      case Education.intermediate:
        return 'Intermediate';
      case Education.graduation:
        return 'Graduation';
      case Education.bachelorDegree:
        return 'Bachelor Degree';
      case Education.masterDegree:
        return 'Master Degree';
      default:
        return 'Not specified';
    }
  }

  @override
  Widget build(BuildContext context) {
    final fullName = '${candidate.firstName} ${candidate.lastName}';
    
    // Debug logs - detailed inspection
    debugPrint('======================================');
    debugPrint('👤 Candidate: $fullName');
    debugPrint('   Gender value: ${candidate.gender}');
    debugPrint('   Gender type: ${candidate.gender.runtimeType}');
    debugPrint('   Gender == true: ${candidate.gender == true}');
    debugPrint('   Gender == false: ${candidate.gender == false}');
    debugPrint('   Gender == null: ${candidate.gender == null}');
    debugPrint('   Location string: ${candidate.location}');
    debugPrint('======================================');
    
    // Location is now a simple string from API
    final location = candidate.location ?? 'Not specified';
    
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
          // Avatar
          CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.secondary.withValues(alpha: 0.3),
            backgroundImage: candidate.avatarUrl != null 
                ? NetworkImage(candidate.avatarUrl!)
                : null,
            child: candidate.avatarUrl == null
                ? Text(
                    candidate.firstName[0].toUpperCase(),
                    style: AppTextStyles.heading2.copyWith(color: AppColors.primary),
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
                  fullName,
                  style: AppTextStyles.heading3.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getEducationLabel(candidate.education),
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      candidate.gender == false 
                          ? Icons.male 
                          : candidate.gender == true 
                              ? Icons.female 
                              : Icons.help_outline,
                      size: 16,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      candidate.gender == false 
                          ? 'Male' 
                          : candidate.gender == true 
                              ? 'Female' 
                              : 'Not specified',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textTertiary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textTertiary,
                          fontSize: 12,
                        ),
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
