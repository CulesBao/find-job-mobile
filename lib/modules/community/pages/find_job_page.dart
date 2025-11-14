import 'package:find_job_mobile/modules/community/models/job_card_data.dart';
import 'package:find_job_mobile/modules/community/widgets/job_card.dart';
import 'package:find_job_mobile/modules/community/widgets/search_bar_widget.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class FindJobPage extends StatefulWidget {
  const FindJobPage({super.key});

  @override
  State<FindJobPage> createState() => _FindJobPageState();
}

class _FindJobPageState extends State<FindJobPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _showAdvancedFilters = false;

  String? _selectedProvince;
  String? _selectedJobType;
  String? _selectedEducation;
  String? _selectedSalaryType;

  // Filter options - will be used when implementing filter selection dialogs
  // final List<String> _provinces = ['Hanoi', 'Ho Chi Minh', 'Da Nang', 'Hai Phong'];
  // final List<String> _jobTypes = ['Full-time', 'Part-time', 'Remote', 'Internship'];
  // final List<String> _educations = ['High School', 'Bachelor', 'Master', 'PhD'];
  // final List<String> _salaryTypes = ['Monthly', 'Hourly', 'Contract'];

  final List<JobCardData> _jobs = const [
    JobCardData(
      title: 'UI/UX Designer',
      company: 'Design Hub',
      location: 'Hanoi, Vietnam',
      salary: '\$1,200 - \$1,600',
      jobType: 'Full-time',
      tags: ['Design', 'Figma', 'Sketch'],
    ),
    JobCardData(
      title: 'Flutter Developer',
      company: 'TechX Studio',
      location: 'Remote',
      salary: '\$1,500 - \$2,200',
      jobType: 'Remote',
      tags: ['Mobile', 'Flutter', 'Dart'],
    ),
    JobCardData(
      title: 'Marketing Specialist',
      company: 'Bright Agency',
      location: 'Ho Chi Minh, Vietnam',
      salary: '\$900 - \$1,300',
      jobType: 'Part-time',
      tags: ['Marketing', 'SEO', 'Content'],
    ),
    JobCardData(
      title: 'Marketing Specialist',
      company: 'Bright Agency',
      location: 'Ho Chi Minh, Vietnam',
      salary: '\$900 - \$1,300',
      jobType: 'Part-time',
      tags: ['Marketing', 'SEO', 'Content'],
    ),
    JobCardData(
      title: 'Marketing Specialist',
      company: 'Bright Agency',
      location: 'Ho Chi Minh, Vietnam',
      salary: '\$900 - \$1,300',
      jobType: 'Part-time',
      tags: ['Marketing', 'SEO', 'Content'],
    ),
    JobCardData(
      title: 'Marketing Specialist',
      company: 'Bright Agency',
      location: 'Ho Chi Minh, Vietnam',
      salary: '\$900 - \$1,300',
      jobType: 'Part-time',
      tags: ['Marketing', 'SEO', 'Content'],
    ),
    JobCardData(
      title: 'Marketing Specialist',
      company: 'Bright Agency',
      location: 'Ho Chi Minh, Vietnam',
      salary: '\$900 - \$1,300',
      jobType: 'Part-time',
      tags: ['Marketing', 'SEO', 'Content'],
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: AppColors.textTertiary.withValues(alpha: 0.1),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Find Jobs',
          style: AppTextStyles.heading3.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 24),
                    SearchBarWidget(
                      searchController: _searchController,
                      showAdvancedFilters: _showAdvancedFilters,
                      onToggleFilters: () {
                        setState(() {
                          _showAdvancedFilters = !_showAdvancedFilters;
                        });
                      },
                      onSearch: () {
                        // TODO: Implement search functionality
                      },
                      selectedProvince: _selectedProvince,
                      selectedJobType: _selectedJobType,
                      selectedEducation: _selectedEducation,
                      selectedSalaryType: _selectedSalaryType,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Recommended Jobs',
                  style: AppTextStyles.heading2.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              sliver: SliverList.separated(
                itemCount: _jobs.length,
                itemBuilder: (context, index) => JobCard(data: _jobs[index]),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover new opportunities',
          style: AppTextStyles.label.copyWith(
            color: AppColors.accent,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Find your dream job',
          style: AppTextStyles.heading1.copyWith(color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
