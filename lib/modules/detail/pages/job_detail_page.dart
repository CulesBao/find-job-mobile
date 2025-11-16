import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:find_job_mobile/app/config/route_path.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showFullDescription = false;
  final Set<String> _bookmarkedCompanies = {};

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
            _buildCompanyHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildDescriptionTab(), _buildCompanyTab()],
              ),
            ),
            _buildBottomBar(),
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

  Widget _buildCompanyHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: const Color(0xFFAFECFE),
              borderRadius: BorderRadius.circular(48),
            ),
            child: Center(
              child: Container(
                width: 54.6,
                height: 54.6,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'UI/UX Designer',
            style: AppTextStyles.heading3.copyWith(
              color: const Color(0xFF0D0140),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Google',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.circle, size: 6, color: Color(0xFF0D0140)),
              ),
              Text(
                'California',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.circle, size: 6, color: Color(0xFF0D0140)),
              ),
              Text(
                '1 day ago',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.primary,
        labelStyle: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        unselectedLabelStyle: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        onTap: (index) {
          setState(() {});
        },
        tabs: const [
          Tab(text: 'Description'),
          Tab(text: 'Company'),
        ],
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildJobInfo(),
          const SizedBox(height: 20),
          _buildJobDescription(),
          const SizedBox(height: 20),
          _buildResponsibilities(),
          const SizedBox(height: 20),
          _buildInformations(),
          const SizedBox(height: 20),
          _buildRelativeJobs(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildJobInfo() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Salary',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$15K',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Job Type',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Full-Time',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Position',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Senior',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF0D0140),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJobDescription() {
    const fullText =
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.';
    const shortText =
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem ...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Description',
          style: AppTextStyles.heading3.copyWith(
            color: const Color(0xFF150B3D),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _showFullDescription ? fullText : shortText,
          style: AppTextStyles.body.copyWith(
            color: const Color(0xFF524B6B),
            fontSize: 12,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            setState(() {
              _showFullDescription = !_showFullDescription;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF7551FF).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              _showFullDescription ? 'Show less' : 'Read more',
              style: AppTextStyles.body.copyWith(
                color: const Color(0xFF0D0140),
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResponsibilities() {
    final responsibilities = [
      'Sed ut perspiciatis unde omnis iste natus error sit.',
      'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.',
      'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
      'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Responsibilities',
          style: AppTextStyles.heading3.copyWith(
            color: const Color(0xFF150B3D),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        ...responsibilities.map(
          (resp) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Color(0xFF524B6B),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    resp,
                    style: AppTextStyles.body.copyWith(
                      color: const Color(0xFF524B6B),
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInformations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informations',
          style: AppTextStyles.heading3.copyWith(
            color: const Color(0xFF150B3D),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        _buildInfoItem('Job Posted', '03 June'),
        const Divider(color: Color(0xFFE0E0E0)),
        _buildInfoItem('Job Expired', '23 August'),
        const Divider(color: Color(0xFFE0E0E0)),
        _buildInfoItem('Education', 'Bachelor Degree'),
        const Divider(color: Color(0xFFE0E0E0)),
        _buildInfoItem('Salary', '\$150 - \$190'),
        const Divider(color: Color(0xFFE0E0E0)),
        _buildInfoItem('Salary Type', 'Monthly'),
        const Divider(color: Color(0xFFE0E0E0)),
        _buildInfoItem('Job Type', 'Software'),
      ],
    );
  }

  Widget _buildRelativeJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Relative Jobs',
          style: AppTextStyles.heading3.copyWith(
            color: const Color(0xFF150B3D),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        _buildRelativeJobCard(
          'Software Manager',
          'FPT Software',
          '\$10M - \$15M',
          '01 days ago',
        ),
        const SizedBox(height: 12),
        _buildRelativeJobCard(
          'UI/UX Designer',
          'FPT Software',
          '\$7M - \$10M',
          '07 days ago',
        ),
      ],
    );
  }

  Widget _buildRelativeJobCard(
    String title,
    String company,
    String salary,
    String time,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFAFECFE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.business,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    color: const Color(0xFF150B3D),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF524B6B),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      salary,
                      style: AppTextStyles.caption.copyWith(
                        color: const Color(0xFF524B6B),
                        fontSize: 11,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        Icons.circle,
                        size: 4,
                        color: Color(0xFF524B6B),
                      ),
                    ),
                    Text(
                      time,
                      style: AppTextStyles.caption.copyWith(
                        color: const Color(0xFF524B6B),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              color: const Color(0xFF150B3D),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.body.copyWith(
              color: const Color(0xFF524B6B),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildAboutCompany(),
          const SizedBox(height: 20),
          _buildCompanyDetails(),
          const SizedBox(height: 20),
          _buildRelativeCompanies(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAboutCompany() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Company',
          style: AppTextStyles.heading3.copyWith(
            color: const Color(0xFF150B3D),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          style: AppTextStyles.body.copyWith(
            color: const Color(0xFF524B6B),
            fontSize: 12,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas.',
          style: AppTextStyles.body.copyWith(
            color: const Color(0xFF524B6B),
            fontSize: 12,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.',
          style: AppTextStyles.body.copyWith(
            color: const Color(0xFF524B6B),
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company Details',
          style: AppTextStyles.heading3.copyWith(
            color: const Color(0xFF150B3D),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        _buildInfoItem('Since', '01 February 2019'),
        const Divider(color: Color(0xFFE0E0E0)),
        _buildInfoItem('Website', 'https://fptsoftware.com/'),
        const Divider(color: Color(0xFFE0E0E0)),
        _buildInfoItem('Location', 'Thanh Xuan, Ha Noi'),
      ],
    );
  }

  Widget _buildRelativeCompanies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Relative Companies',
          style: AppTextStyles.heading3.copyWith(
            color: const Color(0xFF150B3D),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        _buildRelativeCompanyCard(
          'FPT Software',
          'Thanh Xuan, Ha Noi',
          '5 jobs available',
        ),
        const SizedBox(height: 12),
        _buildRelativeCompanyCard(
          'Viettel Solutions',
          'Cau Giay, Ha Noi',
          '3 jobs available',
        ),
      ],
    );
  }

  Widget _buildRelativeCompanyCard(
    String name,
    String location,
    String jobsAvailable,
  ) {
    final companyId = '$name-$location';
    final isBookmarked = _bookmarkedCompanies.contains(companyId);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFAFECFE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.business,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.body.copyWith(
                    color: const Color(0xFF150B3D),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF524B6B),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  jobsAvailable,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (isBookmarked) {
                  _bookmarkedCompanies.remove(companyId);
                } else {
                  _bookmarkedCompanies.add(companyId);
                }
              });
            },
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? const Color(0xFFFFA500) : AppColors.primary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.push(RoutePath.jobApply);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              child: Text(
                'APPLY NOW',
                style: AppTextStyles.button.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.84,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
