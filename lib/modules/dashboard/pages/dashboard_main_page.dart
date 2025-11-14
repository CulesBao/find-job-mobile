import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/modules/dashboard/pages/candidate_dashboard_page.dart';
import 'package:find_job_mobile/modules/dashboard/pages/employer_dashboard_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (AuthHelper.isEmployer) {
      return const EmployerDashboardPage();
    } else {
      return const CandidateDashboardPage();
    }
  }
}
