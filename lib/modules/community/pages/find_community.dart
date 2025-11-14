import 'package:find_job_mobile/modules/community/data/sample_data.dart';
import 'package:find_job_mobile/modules/community/widgets/advanced_filters_section.dart';
import 'package:find_job_mobile/modules/community/widgets/candidate_card.dart';
import 'package:find_job_mobile/modules/community/widgets/employer_card.dart';
import 'package:find_job_mobile/modules/community/widgets/find_header.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class FindCommunityPage extends StatefulWidget {
  const FindCommunityPage({super.key});

  @override
  State<FindCommunityPage> createState() => _FindCommunityPageState();
}

class _FindCommunityPageState extends State<FindCommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  bool _showCandidateFilters = false;
  bool _showEmployerFilters = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header with gradient background
            SliverToBoxAdapter(
              child: FindHeader(
                searchController: _searchController,
                onFilterTap: () {
                  setState(() {
                    if (_tabController.index == 0) {
                      _showCandidateFilters = !_showCandidateFilters;
                    } else {
                      _showEmployerFilters = !_showEmployerFilters;
                    }
                  });
                },
              ),
            ),
            // Tab bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 3,
                  labelStyle: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  tabs: const [
                    Tab(text: 'Candidates'),
                    Tab(text: 'Employers'),
                  ],
                ),
              ),
            ),
            // Content
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: [_buildCandidatesTab(), _buildEmployersTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCandidatesTab() {
    return CustomScrollView(
      slivers: [
        if (_showCandidateFilters)
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            sliver: SliverToBoxAdapter(child: CandidateAdvancedFilters()),
          ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList.separated(
            itemCount: sampleCandidates.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return CandidateCard(candidate: sampleCandidates[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmployersTab() {
    return CustomScrollView(
      slivers: [
        if (_showEmployerFilters)
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            sliver: SliverToBoxAdapter(child: EmployerAdvancedFilters()),
          ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList.separated(
            itemCount: sampleEmployers.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return EmployerCard(employer: sampleEmployers[index]);
            },
          ),
        ),
      ],
    );
  }
}

// Sliver tab bar delegate
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: AppColors.background, child: tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}
