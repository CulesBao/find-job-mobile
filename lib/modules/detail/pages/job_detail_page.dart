import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/job_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/application_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:find_job_mobile/app/config/route_path.dart';
import 'package:intl/intl.dart';
import 'package:find_job_mobile/shared/data/dto/filter_job_request.dart';

class JobDetailPage extends StatefulWidget {
  final String jobId;

  const JobDetailPage({super.key, required this.jobId});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  bool _showFullDescription = false;
  bool _isLoading = true;
  bool _isCheckingApplicationStatus = true;
  bool _hasApplied = false;
  JobDto? _job;
  List<JobDto> _relatedJobs = [];
  final _repository = getIt<JobRepository>();
  final _applicationRepository = getIt<ApplicationRepository>();

  @override
  void initState() {
    super.initState();
    _loadJobData();
  }

  Future<void> _loadJobData() async {
    try {
      final response = await _repository.getJobById(widget.jobId);
      if (mounted) {
        setState(() {
          _job = response.data;
        });
        // Load related jobs and check application status after getting the main job
        await Future.wait([
          _loadRelatedJobs(),
          _checkApplicationStatus(),
        ]);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load job: $e')));
      }
    }
  }

  Future<void> _checkApplicationStatus() async {
    try {
      final response = await _applicationRepository.getApplicationStatus(widget.jobId);
      
      // Debug: Print raw response
      debugPrint('=== Application Status Check ===');
      debugPrint('Job ID: ${widget.jobId}');
      debugPrint('Message: ${response.message}');
      debugPrint('Data (has applied): ${response.data}');
      
      if (mounted) {
        setState(() {
          _hasApplied = response.data ?? false;
          _isCheckingApplicationStatus = false;
        });
        
        debugPrint('Has Applied: $_hasApplied');
        debugPrint('================================');
      }
    } catch (e, stackTrace) {
      // If error (e.g., user not logged in or wrong role), assume not applied
      debugPrint('=== Error checking application status ===');
      debugPrint('Error: $e');
      debugPrint('StackTrace: $stackTrace');
      debugPrint('=========================================');
      
      if (mounted) {
        setState(() {
          _hasApplied = false;
          _isCheckingApplicationStatus = false;
        });
      }
    }
  }

  Future<void> _loadRelatedJobs() async {
    try {
      // Use empty filter to get all jobs
      final response = await _repository.getJobByFilter(
        const FilterJobRequest(),
        page: 0,
        size: 10, // Get 10 jobs to filter out current job and take 3
      );
      if (mounted) {
        setState(() {
          // Filter out current job and take max 3 jobs
          _relatedJobs = response.data?.content
              .where((job) => job.id != widget.jobId)
              .take(3)
              .toList() ?? [];
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_job == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: const Text('Job Details')),
        body: const Center(child: Text('Job not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildCompanyHeader(),
                  _buildJobContent(),
                ],
              ),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Job Details',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Empty container for spacing balance
            const SizedBox(width: 36),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyHeader() {
    final createdDate = _job?.createdAt != null 
        ? _formatTimeAgo(DateTime.parse(_job!.createdAt!))
        : 'Recently';
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.secondary.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
              image: _job?.companyLogo != null
                  ? DecorationImage(
                      image: NetworkImage(_job!.companyLogo!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _job?.companyLogo == null
                ? const Icon(
                    Icons.business,
                    color: AppColors.primary,
                    size: 48,
                  )
                : null,
          ),
          const SizedBox(height: 16),
          Text(
            _job?.title ?? 'Job Title',
            style: AppTextStyles.heading2.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            _job?.companyName ?? 'Company',
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              if (_job?.jobLocation != null)
                _buildChip(
                  Icons.location_on_outlined,
                  _job!.jobLocation!,
                ),
              _buildChip(
                Icons.access_time_outlined,
                createdDate,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.primary,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 30) {
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  Widget _buildJobContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildJobInfo(),
          const SizedBox(height: 24),
          _buildJobDescription(),
          const SizedBox(height: 24),
          _buildResponsibilities(),
          const SizedBox(height: 24),
          _buildInformations(),
          const SizedBox(height: 24),
          _buildRelativeJobs(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildJobInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildInfoColumn(
              Icons.attach_money,
              'Salary',
              _formatSalary(_job),
            ),
          ),
          Container(
            width: 1,
            height: 50,
            color: AppColors.background,
          ),
          Expanded(
            child: _buildInfoColumn(
              Icons.work_outline,
              'Job Type',
              _formatJobType(_job?.jobType),
            ),
          ),
          Container(
            width: 1,
            height: 50,
            color: AppColors.background,
          ),
          Expanded(
            child: _buildInfoColumn(
              Icons.school_outlined,
              'Education',
              _job?.education ?? 'N/A',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  String _formatSalary(JobDto? job) {
    if (job == null || (job.minSalary == null && job.maxSalary == null)) {
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

  String _formatJobType(JobType? jobType) {
    if (jobType == null) return 'N/A';
    return jobType.name.replaceAll('_', ' ').split(' ').map((word) => 
      word[0].toUpperCase() + word.substring(1).toLowerCase()
    ).join(' ');
  }

  Widget _buildJobDescription() {
    final description = _job?.description ?? 'No description available.';
    final shortText = description.length > 200 
        ? '${description.substring(0, 200)}...' 
        : description;

    return _buildSection(
      'Job Description',
      Icons.description_outlined,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _showFullDescription ? description : shortText,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          if (description.length > 200) ...[
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showFullDescription = !_showFullDescription;
                });
              },
              child: Text(
                _showFullDescription ? '▲ Show less' : '▼ Read more',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, Widget content) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }

  Widget _buildResponsibilities() {
    final responsibilities = _job?.responsibility?.split('\n').where((r) => r.trim().isNotEmpty).toList() ?? [];
    
    if (responsibilities.isEmpty) {
      return const SizedBox.shrink();
    }

    return _buildSection(
      'Responsibilities',
      Icons.checklist_outlined,
      Column(
        children: responsibilities.map(
          (resp) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 12,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    resp,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).toList(),
      ),
    );
  }

  Widget _buildInformations() {
    final postedDate = _job?.createdAt != null 
        ? DateFormat('dd MMM yyyy').format(DateTime.parse(_job!.createdAt!))
        : 'N/A';
    final expiredDate = _job?.expiredAt != null 
        ? DateFormat('dd MMM yyyy').format(DateTime.parse(_job!.expiredAt!))
        : 'N/A';
    
    return _buildSection(
      'Job Information',
      Icons.info_outline,
      Column(
        children: [
          _buildInfoRow(Icons.calendar_today_outlined, 'Posted', postedDate),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.event_outlined, 'Expires', expiredDate),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.payments_outlined, 'Salary', _formatSalary(_job)),
          const SizedBox(height: 12),
          if (_job?.salaryType != null) ...[
            _buildInfoRow(Icons.schedule_outlined, 'Salary Type', _formatSalaryType(_job!.salaryType)),
            const SizedBox(height: 12),
          ],
          if (_job?.jobLocation != null)
            _buildInfoRow(Icons.location_on_outlined, 'Location', _job!.jobLocation!),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 16,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatSalaryType(SalaryType? salaryType) {
    if (salaryType == null) return 'N/A';
    return salaryType.name[0].toUpperCase() + salaryType.name.substring(1).toLowerCase();
  }

  Widget _buildRelativeJobs() {
    if (_relatedJobs.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.work_outline,
              color: AppColors.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Similar Jobs',
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ..._relatedJobs.map((job) {
          final createdDate = job.createdAt != null 
              ? _formatTimeAgo(DateTime.parse(job.createdAt!))
              : 'Recently';
          
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildRelativeJobCard(
              job,
              createdDate,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildRelativeJobCard(
    JobDto job,
    String timeAgo,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => JobDetailPage(jobId: job.id),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.background,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
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
                  ? const Icon(
                      Icons.business,
                      color: AppColors.primary,
                      size: 28,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    job.companyName ?? 'Company',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _formatSalary(job),
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.primary,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.access_time,
                        size: 12,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        timeAgo,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildBottomBar() {
    final isLoading = _isLoading || _isCheckingApplicationStatus;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_hasApplied && !isLoading)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'You have already applied for this job',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.success,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ElevatedButton(
              onPressed: (isLoading || _hasApplied)
                  ? null
                  : () async {
                      // Double check before navigation
                      if (_hasApplied) {
                        debugPrint('Blocked: User has already applied');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('You have already applied for this job'),
                            backgroundColor: AppColors.error,
                          ),
                        );
                        return;
                      }
                      
                      debugPrint('Navigating to upload CV page for job: ${widget.jobId}');
                      
                      // Navigate and wait for result
                      final result = await context.push('${RoutePath.jobApply}/${widget.jobId}');
                      
                      debugPrint('Returned from upload CV page with result: $result');
                      
                      // If application was submitted, refresh the application status
                      if (result == true && mounted) {
                        debugPrint('Refreshing application status after successful submission');
                        await _checkApplicationStatus();
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: AppColors.textSecondary.withValues(alpha: 0.3),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _hasApplied ? Icons.check_circle_outline : Icons.send,
                          size: 20,
                          color: _hasApplied 
                              ? AppColors.textSecondary.withValues(alpha: 0.5)
                              : Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _hasApplied ? 'Already Applied' : 'Apply Now',
                          style: AppTextStyles.button.copyWith(
                            color: _hasApplied 
                                ? AppColors.textSecondary.withValues(alpha: 0.5)
                                : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
