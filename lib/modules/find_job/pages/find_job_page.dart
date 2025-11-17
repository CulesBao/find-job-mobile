import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/modules/community/widgets/find_header.dart';
import 'package:find_job_mobile/shared/data/dto/filter_job_request.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/models/province_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/job_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/location_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/modules/detail/pages/job_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FindJobPage extends StatefulWidget {
  const FindJobPage({super.key});

  @override
  State<FindJobPage> createState() => _FindJobPageState();
}

class _FindJobPageState extends State<FindJobPage> {
  final TextEditingController _searchController = TextEditingController();
  final _jobRepository = getIt<JobRepository>();
  final _locationRepository = getIt<LocationRepository>();
  
  bool _showAdvancedFilters = false;

  // Filter states
  ProvinceDto? _selectedProvince;
  JobType? _selectedJobType;
  Education? _selectedEducation;
  SalaryType? _selectedSalaryType;
  
  // Province list
  List<ProvinceDto> _provinces = [];
  
  // Data
  List<JobDto> _jobs = [];
  
  // Loading & pagination
  bool _isLoadingJobs = false;
  int _jobPage = 0;
  bool _hasMoreJobs = true;
  
  // Error state
  String? _jobError;

  @override
  void initState() {
    super.initState();
    _loadProvinces();
    _loadJobs(refresh: true);
  }

  Future<void> _loadProvinces() async {
    try {
      final response = await _locationRepository.getProvinces();
      if (mounted && response.data != null) {
        setState(() {
          _provinces = response.data!.provinces;
        });
      }
    } catch (e) {
      debugPrint('Failed to load provinces: $e');
    }
  }

  Future<void> _loadJobs({bool refresh = false}) async {
    if (_isLoadingJobs || (!refresh && !_hasMoreJobs)) return;

    setState(() {
      _isLoadingJobs = true;
      _jobError = null;
      if (refresh) {
        _jobPage = 0;
        _jobs.clear();
        _hasMoreJobs = true;
      }
    });

    try {
      final searchText = _searchController.text.trim();
      
      final filterRequest = FilterJobRequest(
        title: searchText.isNotEmpty ? searchText : null,
        provinceCode: _selectedProvince?.code,
        jobType: _selectedJobType,
        education: _selectedEducation,
        salaryType: _selectedSalaryType,
      );

      final response = await _jobRepository.getJobByFilter(
        filterRequest,
        page: _jobPage,
        size: 10,
      );

      if (mounted) {
        if (response.data != null) {
          final newJobs = response.data?.content ?? [];
          final isLast = response.data?.last ?? true;

          setState(() {
            _jobs.addAll(newJobs);
            _hasMoreJobs = !isLast;
            if (newJobs.isNotEmpty) {
              _jobPage++;
            }
            _isLoadingJobs = false;
          });
        } else {
          setState(() {
            _jobError = 'Failed to load jobs';
            _isLoadingJobs = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _jobError = 'Error loading jobs: ${e.toString()}';
          _isLoadingJobs = false;
        });
      }
    }
  }

  Future<void> _onRefresh() async {
    await _loadJobs(refresh: true);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch() {
    _loadJobs(refresh: true);
  }

  int _getActiveFiltersCount() {
    int count = 0;
    if (_selectedProvince != null) count++;
    if (_selectedJobType != null) count++;
    if (_selectedEducation != null) count++;
    if (_selectedSalaryType != null) count++;
    return count;
  }

  String _formatJobType(JobType? jobType) {
    if (jobType == null) return '';
    return jobType.name.replaceAll('_', ' ').split(' ').map((word) => 
      word[0].toUpperCase() + word.substring(1).toLowerCase()
    ).join(' ');
  }

  String _formatEducation(Education? education) {
    if (education == null) return '';
    return education.name.replaceAll('_', ' ').split(' ').map((word) => 
      word[0].toUpperCase() + word.substring(1).toLowerCase()
    ).join(' ');
  }

  String _formatSalaryType(SalaryType? salaryType) {
    if (salaryType == null) return '';
    return salaryType.name[0].toUpperCase() + salaryType.name.substring(1).toLowerCase();
  }

  String _formatSalary(JobDto job) {
    if (job.minSalary == null && job.maxSalary == null) {
      return 'Negotiable';
    }
    
    final currencySymbol = _getCurrencySymbol(job.currency);
    
    if (job.minSalary != null && job.maxSalary != null) {
      return '$currencySymbol${_formatNumber(job.minSalary!)} - $currencySymbol${_formatNumber(job.maxSalary!)}';
    } else if (job.minSalary != null) {
      return 'From $currencySymbol${_formatNumber(job.minSalary!)}';
    } else {
      return 'Up to $currencySymbol${_formatNumber(job.maxSalary!)}';
    }
  }

  String _getCurrencySymbol(Currency? currency) {
    switch (currency) {
      case Currency.usd:
        return '\$';
      case Currency.vnd:
        return '₫';
      case Currency.eur:
        return '€';
      case Currency.gbp:
        return '£';
      default:
        return '\$';
    }
  }

  String _formatNumber(double number) {
    final formatter = NumberFormat.compact();
    return formatter.format(number);
  }

  int _getDaysRemaining(String? expiredAt) {
    if (expiredAt == null) return 999;
    
    try {
      final expiredDate = DateTime.parse(expiredAt);
      final now = DateTime.now();
      final difference = expiredDate.difference(now);
      
      return difference.inDays > 0 ? difference.inDays : 0;
    } catch (e) {
      return 999;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
            slivers: [
              // Header with gradient background and back button (passed as leading)
              SliverToBoxAdapter(
                child: FindHeader(
                  searchController: _searchController,
                  onSearchSubmit: _onSearch,
                  onFindTap: _onSearch,
                  onFilterTap: () {
                    setState(() {
                      _showAdvancedFilters = !_showAdvancedFilters;
                    });
                  },
                  leading: SafeArea(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                          semanticLabel: 'Back',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Advanced Filters Section (if visible)
              if (_showAdvancedFilters)
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  sliver: SliverToBoxAdapter(
                    child: _buildAdvancedFilters(),
                  ),
                ),
              
              // Section Title
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Available Jobs',
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              // Job List or Loading/Error States
              if (_isLoadingJobs && _jobs.isEmpty)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (_jobError != null && _jobs.isEmpty)
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 48, color: AppColors.error),
                        const SizedBox(height: 16),
                        Text(
                          _jobError!,
                          style: AppTextStyles.body.copyWith(color: AppColors.error),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () => _loadJobs(refresh: true),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else if (_jobs.isEmpty)
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.work_outline, size: 48, color: AppColors.textSecondary),
                        const SizedBox(height: 16),
                        Text(
                          'No jobs found',
                          style: AppTextStyles.heading3.copyWith(color: AppColors.textPrimary),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  sliver: SliverList.separated(
                    itemCount: _jobs.length + (_hasMoreJobs ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _jobs.length) {
                        // Load more indicator
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted && !_isLoadingJobs) {
                            _loadJobs();
                          }
                        });
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return _buildJobCard(_jobs[index]);
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobCard(JobDto job) {
    final daysRemaining = _getDaysRemaining(job.expiredAt);
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const JobDetailPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.textTertiary.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Logo + Job Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  image: job.companyLogo != null
                      ? DecorationImage(
                          image: NetworkImage(job.companyLogo!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: job.companyLogo == null
                    ? Icon(
                        Icons.business,
                        color: AppColors.primary,
                        size: 28,
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: AppTextStyles.heading3.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job.companyName ?? 'Company',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Location
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  job.jobLocation ?? 'Vietnam',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Job Type & Education
          if (job.jobType != null)
            Row(
              children: [
                Icon(
                  Icons.work_outline,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    _formatJobType(job.jobType),
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          if (job.jobType != null && job.education != null)
            const SizedBox(height: 8),
          if (job.education != null && job.education!.isNotEmpty)
            Row(
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    job.education!,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          if (job.jobType != null || (job.education != null && job.education!.isNotEmpty))
            const SizedBox(height: 16),
          
          // Badges
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              // Salary badge
              _buildBadge(
                icon: Icons.payments_outlined,
                label: _formatSalary(job),
                color: AppColors.success,
              ),
              
              // Days remaining badge
              _buildBadge(
                icon: Icons.schedule,
                label: '$daysRemaining days',
                color: daysRemaining > 3 ? AppColors.success : AppColors.accent,
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildBadge({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Filters',
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (_getActiveFiltersCount() > 0) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${_getActiveFiltersCount()}',
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedProvince = null;
                    _selectedJobType = null;
                    _selectedEducation = null;
                    _selectedSalaryType = null;
                  });
                  _loadJobs(refresh: true);
                },
                child: Text(
                  'Clear All',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Province',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          _buildFilterChip('Province', _selectedProvince?.name),
          const SizedBox(height: 16),
          Text(
            'Job Type',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          _buildFilterChip('Job Type', _selectedJobType != null ? _formatJobType(_selectedJobType) : null),
          const SizedBox(height: 16),
          Text(
            'Education',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          _buildFilterChip('Education', _selectedEducation != null ? _formatEducation(_selectedEducation) : null),
          const SizedBox(height: 16),
          Text(
            'Salary Type',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          _buildFilterChip('Salary Type', _selectedSalaryType != null ? _formatSalaryType(_selectedSalaryType) : null),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String? value) {
    return InkWell(
      onTap: () {
        if (label == 'Province') {
          _showProvinceSelector();
        } else if (label == 'Job Type') {
          _showJobTypeSelector();
        } else if (label == 'Education') {
          _showEducationSelector();
        } else if (label == 'Salary Type') {
          _showSalaryTypeSelector();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: value != null ? AppColors.primary : AppColors.textTertiary.withValues(alpha: 0.3),
            width: value != null ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? 'Select $label',
              style: AppTextStyles.body.copyWith(
                color: value != null ? AppColors.primary : AppColors.textSecondary,
                fontWeight: value != null ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: value != null ? AppColors.primary : AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  void _showProvinceSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textTertiary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Province',
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
            
            // Clear selection option
            if (_selectedProvince != null)
              ListTile(
                leading: const Icon(Icons.clear, color: AppColors.error),
                title: Text(
                  'Clear selection',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  setState(() => _selectedProvince = null);
                  Navigator.pop(context);
                  _loadJobs(refresh: true);
                },
              ),
            
            // Province list
            Expanded(
              child: _provinces.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _provinces.length,
                      itemBuilder: (context, index) {
                        final province = _provinces[index];
                        final isSelected = _selectedProvince?.code == province.code;
                        
                        return ListTile(
                          leading: Icon(
                            isSelected ? Icons.check_circle : Icons.location_on_outlined,
                            color: isSelected ? AppColors.primary : AppColors.textSecondary,
                          ),
                          title: Text(
                            province.name,
                            style: AppTextStyles.body.copyWith(
                              color: isSelected ? AppColors.primary : AppColors.textPrimary,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                          onTap: () {
                            setState(() => _selectedProvince = province);
                            Navigator.pop(context);
                            _loadJobs(refresh: true);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _showJobTypeSelector() {
    final jobTypes = JobType.values;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textTertiary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Job Type',
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
            
            // Clear selection option
            if (_selectedJobType != null)
              ListTile(
                leading: const Icon(Icons.clear, color: AppColors.error),
                title: Text(
                  'Clear selection',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  setState(() => _selectedJobType = null);
                  Navigator.pop(context);
                  _loadJobs(refresh: true);
                },
              ),
            
            // Job type list
            Expanded(
              child: ListView.builder(
                itemCount: jobTypes.length,
                itemBuilder: (context, index) {
                  final jobType = jobTypes[index];
                  final isSelected = _selectedJobType == jobType;

                  return ListTile(
                    leading: Icon(
                      isSelected ? Icons.check_circle : Icons.work_outline,
                      color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    ),
                    title: Text(
                      _formatJobType(jobType),
                      style: AppTextStyles.body.copyWith(
                        color: isSelected ? AppColors.primary : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() => _selectedJobType = jobType);
                      Navigator.pop(context);
                      _loadJobs(refresh: true);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEducationSelector() {
    final educations = Education.values;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textTertiary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Education',
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
            
            // Clear selection option
            if (_selectedEducation != null)
              ListTile(
                leading: const Icon(Icons.clear, color: AppColors.error),
                title: Text(
                  'Clear selection',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  setState(() => _selectedEducation = null);
                  Navigator.pop(context);
                  _loadJobs(refresh: true);
                },
              ),
            
            // Education list
            Expanded(
              child: ListView.builder(
                itemCount: educations.length,
                itemBuilder: (context, index) {
                  final education = educations[index];
                  final isSelected = _selectedEducation == education;

                  return ListTile(
                    leading: Icon(
                      isSelected ? Icons.check_circle : Icons.school_outlined,
                      color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    ),
                    title: Text(
                      _formatEducation(education),
                      style: AppTextStyles.body.copyWith(
                        color: isSelected ? AppColors.primary : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() => _selectedEducation = education);
                      Navigator.pop(context);
                      _loadJobs(refresh: true);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSalaryTypeSelector() {
    final salaryTypes = SalaryType.values;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textTertiary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Salary Type',
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
            
            // Clear selection option
            if (_selectedSalaryType != null)
              ListTile(
                leading: const Icon(Icons.clear, color: AppColors.error),
                title: Text(
                  'Clear selection',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  setState(() => _selectedSalaryType = null);
                  Navigator.pop(context);
                  _loadJobs(refresh: true);
                },
              ),
            
            // Salary type list
            Expanded(
              child: ListView.builder(
                itemCount: salaryTypes.length,
                itemBuilder: (context, index) {
                  final salaryType = salaryTypes[index];
                  final isSelected = _selectedSalaryType == salaryType;

                  return ListTile(
                    leading: Icon(
                      isSelected ? Icons.check_circle : Icons.payments_outlined,
                      color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    ),
                    title: Text(
                      _formatSalaryType(salaryType),
                      style: AppTextStyles.body.copyWith(
                        color: isSelected ? AppColors.primary : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() => _selectedSalaryType = salaryType);
                      Navigator.pop(context);
                      _loadJobs(refresh: true);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
