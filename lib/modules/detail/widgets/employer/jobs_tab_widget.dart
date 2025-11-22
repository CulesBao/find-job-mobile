import 'package:flutter/material.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/job_card_widget.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class JobsTabWidget extends StatelessWidget {
  final List<JobCardData> jobs;
  final void Function(String?)? onJobTap;

  const JobsTabWidget({super.key, required this.jobs, this.onJobTap});

  @override
  Widget build(BuildContext context) {
    if (jobs.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.work_outline,
                size: 64,
                color: AppColors.textTertiary.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 16),
              Text(
                'No Jobs Available',
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'This company hasn\'t posted any jobs yet.\nCheck back later for new opportunities!',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: jobs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final job = jobs[index];
        return JobCardWidget(
          data: job,
          onTap: onJobTap != null ? () => onJobTap!(job.jobId) : null,
        );
      },
    );
  }
}
