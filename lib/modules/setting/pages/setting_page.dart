import 'package:find_job_mobile/modules/setting/pages/change_password_page.dart';
import 'package:find_job_mobile/modules/setting/pages/applied_job_page.dart';
import 'package:find_job_mobile/modules/setup/screens/setup_screen_candidate_profile.dart';
import 'package:find_job_mobile/modules/setup/screens/setup_screen_employer_profile.dart';
import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    // Show confirmation dialog
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Logout',
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: AppTextStyles.body.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Cancel',
              style: AppTextStyles.button.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: Text(
              'Logout',
              style: AppTextStyles.button.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    if (shouldLogout == true && context.mounted) {
      // Call logout - this will clear local data even if API call fails
      await AuthHelper.logout();

      if (context.mounted) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged out successfully'),
            backgroundColor: AppColors.success,
            duration: Duration(seconds: 1),
          ),
        );

        // Navigate to sign-in screen and clear navigation stack
        context.go('/auth/sign-in');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              _SettingItem(
                icon: Icons.person_outline,
                title: 'Profile',
                subtitle: 'Manage your profile',
                onTap: () {
                  // Navigate to setup screen based on user role
                  if (AuthHelper.isCandidate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetupScreenCandidateProfile(),
                      ),
                    );
                  } else if (AuthHelper.isEmployer) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetupScreenEmployerProfile(),
                      ),
                    );
                  }
                },
              ),
              // Applied Jobs - Only for candidates
              if (AuthHelper.isCandidate)
                _SettingItem(
                  icon: Icons.work_history,
                  title: 'Applied Jobs',
                  subtitle: 'View your job applications',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppliedJobPage(),
                      ),
                    );
                  },
                ),
              _SettingItem(
                icon: Icons.lock_outline,
                title: 'Change Password',
                subtitle: 'Update your account password',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePasswordPage(),
                    ),
                  );
                },
              ),
              _SettingItem(
                icon: Icons.info_outline,
                title: 'About Us',
                subtitle: 'Learn more about us',
                onTap: () {},
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => _handleLogout(context),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: Text(
                    'Logout',
                    style: AppTextStyles.button.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        title: Text(
          title,
          style: AppTextStyles.heading3.copyWith(color: AppColors.textPrimary),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.textTertiary,
        ),
      ),
    );
  }
}