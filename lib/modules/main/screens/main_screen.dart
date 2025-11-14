import 'package:find_job_mobile/modules/community/pages/find_community.dart';
import 'package:find_job_mobile/modules/dashboard/pages/dashboard_main_page.dart';
import 'package:find_job_mobile/modules/setting/pages/setting_page.dart';
import 'package:find_job_mobile/modules/chat/pages/chat_with_ai_page.dart';
import 'package:find_job_mobile/modules/post/pages/post_job_page.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final int? initialTab;

  const MainScreen({super.key, this.initialTab});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    // Set initial tab, default to Dashboard tab (index 0)
    _currentIndex = widget.initialTab ?? 0;
  }

  final List<Widget> _screens = [
    const DashboardScreen(),
    const FindCommunityPage(),
    const ChatWithAiPage(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isEmployer = AuthHelper.isEmployer;

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.textTertiary.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  index: 0,
                  icon: Icons.dashboard_outlined,
                  activeIcon: Icons.dashboard,
                  label: 'Dashboard',
                ),
                _buildNavItem(
                  index: 1,
                  icon: Icons.group,
                  activeIcon: Icons.work,
                  label: 'Community',
                ),
                if (isEmployer)
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostJobPage(),
                          ),
                        );
                        // Refresh job list if job was posted successfully
                        if (result == true) {
                          // TODO: Refresh employer's job list
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Add',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.textTertiary,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                _buildNavItem(
                  index: 2,
                  icon: Icons.chat_outlined,
                  activeIcon: Icons.chat,
                  label: 'Chat',
                ),
                _buildNavItem(
                  index: 3,
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                  label: 'Setting',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isActive = _currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isActive ? activeIcon : icon,
                color: isActive ? AppColors.primary : AppColors.textTertiary,
                size: 26,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: isActive ? AppColors.primary : AppColors.textTertiary,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
