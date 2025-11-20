import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/application_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/application_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:go_router/go_router.dart';

class AppliedJobPage extends StatefulWidget {
  const AppliedJobPage({super.key});

  @override
  State<AppliedJobPage> createState() => _AppliedJobPageState();
}

class _AppliedJobPageState extends State<AppliedJobPage> {
  final _applicationRepository = getIt<ApplicationRepository>();
  final _scrollController = ScrollController();

  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  List<AppliedJobDto> _applications = [];
  String? _errorMessage;
  
  int _currentPage = 0;
  final int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _loadApplications();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingMore && _hasMore) {
        _loadMoreApplications();
      }
    }
  }

  Future<void> _loadApplications() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _currentPage = 0;
      _hasMore = true;
    });

    try {
      final response = await _applicationRepository.getCandidateApplications(
        page: 0,
        limit: _pageSize,
      );
      if (response.success || response.data != null) {
        setState(() {
          _applications = response.data?.content ?? [];
          _hasMore = !(response.data?.last ?? true);
        });
      } else {
        setState(() {
          _errorMessage = response.message;
        });
      }
    } catch (e) {
      debugPrint('Error loading applications: $e');
      setState(() {
        _errorMessage = 'Unable to load applications. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMoreApplications() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final nextPage = _currentPage + 1;
      final response = await _applicationRepository.getCandidateApplications(
        page: nextPage,
        limit: _pageSize,
      );
      
      if (response.success || response.data != null) {
        setState(() {
          _applications.addAll(response.data?.content ?? []);
          _currentPage = nextPage;
          _hasMore = !(response.data?.last ?? true);
        });
      }
    } catch (e) {
      debugPrint('Error loading more applications: $e');
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Applied Jobs',
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: AppColors.textTertiary.withValues(alpha: 0.1),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _loadApplications,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (_errorMessage != null) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.error.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error',
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _errorMessage!,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _loadApplications,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Try Again',
                      style: AppTextStyles.button.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (_applications.isEmpty) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.work_outline,
                    size: 64,
                    color: AppColors.textTertiary.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Applications Yet',
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You haven\'t applied to any jobs yet.\nStart exploring and apply to jobs that interest you!',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.go('/main?tab=find'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Find Jobs',
                      style: AppTextStyles.button.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(20),
      itemCount: _applications.length + (_isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        if (index == _applications.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return _buildApplicationCard(_applications[index]);
      },
    );
  }

  Widget _buildApplicationCard(AppliedJobDto application) {
    final status = application.jobProcess ?? 'APPLICATION_SUBMITTED';
    final statusColor = _getStatusColorFromString(status);
    final statusText = _getStatusTextFromString(status);

    return InkWell(
      onTap: () async {
        // Navigate to detail page and wait for result
        final result = await context.push('/applied-job/${application.applicationId}');
        
        // If withdrawn, refresh the list
        if (result == true) {
          _loadApplications();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
              children: [
                // Company Logo
                if (application.logoUrl != null)
                  Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.background,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        application.logoUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.business,
                            color: AppColors.textTertiary,
                            size: 24,
                          );
                        },
                      ),
                    ),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        application.title ?? 'Unknown Job',
                        style: AppTextStyles.heading3.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        application.name ?? 'Unknown Company',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    statusText,
                    style: AppTextStyles.caption.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Location and Salary
            Row(
              children: [
                if (application.location != null) ...[
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      application.location!,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                if (application.minSalary != null && application.maxSalary != null) ...[
                  Icon(
                    Icons.attach_money,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      '${_formatSalary(application.minSalary!)} - ${_formatSalary(application.maxSalary!)} ${application.currency ?? ''}',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatSalary(double salary) {
    if (salary >= 1000000000) {
      return '${(salary / 1000000000).toStringAsFixed(1)}B';
    } else if (salary >= 1000000) {
      return '${(salary / 1000000).toStringAsFixed(1)}M';
    } else if (salary >= 1000) {
      return '${(salary / 1000).toStringAsFixed(1)}K';
    }
    return salary.toStringAsFixed(0);
  }

  String _getStatusTextFromString(String status) {
    switch (status.toUpperCase()) {
      case 'APPLICATION_SUBMITTED':
      case 'PENDING':
        return 'Pending';
      case 'REVIEWING':
        return 'Reviewing';
      case 'INTERVIEWING':
        return 'Interviewing';
      case 'ACCEPTED':
        return 'Accepted';
      case 'REJECTED':
        return 'Rejected';
      case 'WITHDRAWN':
        return 'Withdrawn';
      default:
        return 'Pending';
    }
  }

  Color _getStatusColorFromString(String status) {
    switch (status.toUpperCase()) {
      case 'APPLICATION_SUBMITTED':
      case 'PENDING':
      case 'REVIEWING':
        return AppColors.accent;
      case 'INTERVIEWING':
        return AppColors.primary;
      case 'ACCEPTED':
        return AppColors.success;
      case 'REJECTED':
      case 'WITHDRAWN':
        return AppColors.error;
      default:
        return AppColors.accent;
    }
  }
}
