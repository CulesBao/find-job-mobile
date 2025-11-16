import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/company_header_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/action_buttons_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/about_tab_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/jobs_tab_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/job_card_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/relative_company_card_widget.dart';

class EmployerDetailPage extends StatefulWidget {
  const EmployerDetailPage({super.key});

  @override
  State<EmployerDetailPage> createState() => _EmployerDetailPageState();
}

class _EmployerDetailPageState extends State<EmployerDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFollowing = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            const CompanyHeaderWidget(
              companyName: 'FPT Software',
              industry: 'Google',
              location: 'California',
              timeAgo: '1 day ago',
              logoUrl:
                  'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
            ),
            ActionButtonsWidget(
              isFollowing: _isFollowing,
              onFollowTap: () {
                setState(() {
                  _isFollowing = !_isFollowing;
                });
              },
              onVisitWebsiteTap: () {
                // Handle visit website
              },
            ),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  AboutTabWidget(
                    aboutUs:
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                    vision:
                        'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.',
                    website: 'https://www.google.com',
                    location: 'Mountain View, California, Amerika Serikat',
                    relativeCompanies: const [
                      RelativeCompanyCardData(
                        companyName: 'Microsoft',
                        industry: 'Technology',
                      ),
                      RelativeCompanyCardData(
                        companyName: 'Apple Inc.',
                        industry: 'Technology',
                      ),
                      RelativeCompanyCardData(
                        companyName: 'Amazon',
                        industry: 'E-commerce',
                      ),
                    ],
                  ),
                  const JobsTabWidget(
                    jobs: [
                      JobCardData(
                        title: 'UI/UX Designer',
                        company: 'FPT Software',
                        salary: '\$7M - \$10M',
                        time: '07 days ago',
                      ),
                      JobCardData(
                        title: 'Software Manager',
                        company: 'FPT Software',
                        salary: '\$10M - \$15M',
                        time: '01 days ago',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: AppColors.textPrimary,
            ),
          ),
          const Icon(Icons.more_vert, size: 24, color: AppColors.textPrimary),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    // Orange tab styling to match Figma
    const tabBg = Colors.white;
    const indicatorColor = Color(0xFFFCA34D); // Orange indicator

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: 50,
      decoration: BoxDecoration(
        color: tabBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: indicatorColor,
            borderRadius: BorderRadius.circular(10),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: const Color(0xFF150B3D),
          labelStyle: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          unselectedLabelStyle: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: 'About us'),
            Tab(text: 'Jobs'),
          ],
        ),
      ),
    );
  }
}
