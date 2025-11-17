import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/company_header_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/action_buttons_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/about_tab_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/jobs_tab_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/job_card_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/employer/relative_company_card_widget.dart';

class EmployerDetailPage extends StatefulWidget {
  final String employerId;

  const EmployerDetailPage({super.key, required this.employerId});

  @override
  State<EmployerDetailPage> createState() => _EmployerDetailPageState();
}

class _EmployerDetailPageState extends State<EmployerDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFollowing = false;
  bool _isLoading = true;
  EmployerProfileDto? _profile;
  final _repository = getIt<EmployerProfileRepository>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final response = await _repository.getProfile(widget.employerId);
      if (mounted) {
        setState(() {
          _profile = response.data;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load profile: $e')));
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_profile == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: const Text('Employer Profile')),
        body: const Center(child: Text('Profile not found')),
      );
    }

    final location = _profile!.province != null
        ? (_profile!.district != null
              ? '${_profile!.district!.name}, ${_profile!.province!.name}'
              : _profile!.province!.name)
        : 'Not specified';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            CompanyHeaderWidget(
              companyName: _profile!.name,
              industry: 'Technology', // TODO: Add industry field
              location: location,
              timeAgo: '1 day ago', // TODO: Calculate from created_at
              logoUrl: _profile!.logoUrl,
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
