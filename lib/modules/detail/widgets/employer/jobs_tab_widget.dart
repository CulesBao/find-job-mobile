import 'package:flutter/material.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/job_card_widget.dart';

class JobsTabWidget extends StatelessWidget {
  final List<JobCardData> jobs;

  const JobsTabWidget({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: jobs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return JobCardWidget(data: jobs[index]);
      },
    );
  }
}
