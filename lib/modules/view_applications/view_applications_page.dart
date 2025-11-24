import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/application_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/application_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/shared/utils/application_status_utils.dart';
import 'package:go_router/go_router.dart';

class ViewApplicationsPage extends StatefulWidget {
  final String jobId;
  final String jobTitle;

  const ViewApplicationsPage({
    super.key,
    required this.jobId,
    required this.jobTitle,
  });

  @override
  State<ViewApplicationsPage> createState() => _ViewApplicationsPageState();
}

class _ViewApplicationsPageState extends State<ViewApplicationsPage> {
  final _applicationRepository = getIt<ApplicationRepository>();
  final _scrollController = ScrollController();

  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  List<ApplicationDto> _applications = [];
  Map<String, ApplicationDto> _detailedApplications = {}; // Cache for detailed data
  String? _errorMessage;
  String? _selectedStatus;

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
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
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
      final response = await _applicationRepository.getEmployerApplications(
        jobId: widget.jobId,
        jobProcess: _selectedStatus,
        page: 0,
        limit: _pageSize,
      );
      if (response.success || response.data != null) {
        setState(() {
          _applications = List.from(response.data?.content ?? []);
          _hasMore = !(response.data?.last ?? true);
        });
        // Load detailed info for each application
        _loadDetailedApplications();
      } else {
        setState(() {
          _errorMessage = response.message;
        });
      }
    } catch (e) {
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
      final response = await _applicationRepository.getEmployerApplications(
        jobId: widget.jobId,
        jobProcess: _selectedStatus,
        page: nextPage,
        limit: _pageSize,
      );

      if (response.success || response.data != null) {
        final newContent = List<ApplicationDto>.from(response.data?.content ?? []);
        setState(() {
          final updatedList = List<ApplicationDto>.from(_applications);
          for (var item in newContent) {
            updatedList.add(item);
          }
          _applications = updatedList;
          _currentPage = nextPage;
          _hasMore = !(response.data?.last ?? true);
        });
        // Load detailed info for newly added applications
        _loadDetailedApplications();
      }
    } catch (e) {
      // Ignore error for loading more
    } finally {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  Future<void> _loadDetailedApplications() async {
    // Load candidate profile for each application sequentially to avoid overwhelming the API
    for (var application in _applications) {
      if (_detailedApplications.containsKey(application.id)) {
        continue; // Already loaded
      }
      
      try {
        final response = await _applicationRepository.getApplicationById(
          application.id,
          includeProfile: true,
        );
        
        if (response.data?.candidateProfile != null) {
          debugPrint('Candidate profile loaded: ${response.data!.candidateProfile!.firstName} ${response.data!.candidateProfile!.lastName}');
        }
        
        // Update even if success is false, as long as we have data
        if (mounted && response.data != null) {
          setState(() {
            _detailedApplications[application.id] = response.data!;
          });
        }
      } catch (e) {
        debugPrint('Error loading detailed application ${application.id}: $e');
      }
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
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.jobTitle,
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  '${_applications.length} Application${_applications.length != 1 ? 's' : ''}',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list, color: AppColors.textPrimary),
            onSelected: (value) {
              setState(() {
                _selectedStatus = value == 'ALL' ? null : value;
              });
              _loadApplications();
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'ALL', child: Text('All')),
              const PopupMenuItem(value: 'APPLICATION_SUBMITTED', child: Text('Submitted')),
              const PopupMenuItem(value: 'APPLICATION_REVIEW', child: Text('Under Review')),
              const PopupMenuItem(value: 'SCREENING', child: Text('Screening')),
              const PopupMenuItem(value: 'PHONE_INTERVIEW', child: Text('Phone Interview')),
              const PopupMenuItem(value: 'TECHNICAL_TEST', child: Text('Technical Test')),
              const PopupMenuItem(value: 'FIRST_INTERVIEW', child: Text('First Interview')),
              const PopupMenuItem(value: 'SECOND_INTERVIEW', child: Text('Second Interview')),
              const PopupMenuItem(value: 'FINAL_INTERVIEW', child: Text('Final Interview')),
              const PopupMenuItem(value: 'OFFER_NEGOTIATION', child: Text('Offer Negotiation')),
              const PopupMenuItem(value: 'OFFER_SENT', child: Text('Offer Sent')),
              const PopupMenuItem(value: 'OFFER_ACCEPTED', child: Text('Offer Accepted')),
              const PopupMenuItem(value: 'HIRED', child: Text('Hired')),
              const PopupMenuItem(value: 'ONBOARDING', child: Text('Onboarding')),
              const PopupMenuItem(value: 'REJECTED', child: Text('Rejected')),
              const PopupMenuItem(value: 'WITHDRAWN', child: Text('Withdrawn')),
            ],
          ),
        ],
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
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: AppColors.error,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage!,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadApplications,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Try Again'),
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
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.textTertiary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.assignment_outlined,
                      size: 48,
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No applications yet',
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Applications will appear here when candidates apply to this job',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
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

  Widget _buildApplicationCard(ApplicationDto application) {
    final status = ApplicationStatusUtils.getStatusText(application.jobProcess);
    final statusColor = ApplicationStatusUtils.getStatusColor(application.jobProcess);
    final statusIcon = ApplicationStatusUtils.getStatusIcon(application.jobProcess);

    // Try to get detailed application data from cache, fallback to original
    final detailedApp = _detailedApplications[application.id] ?? application;
    final candidate = detailedApp.candidateProfile;
    
    // Build candidate name with proper handling of empty/null values
    String candidateName = 'Unknown Candidate';
    if (candidate != null) {
      final firstName = candidate.firstName.trim();
      final lastName = candidate.lastName.trim();
      
      if (firstName.isNotEmpty && lastName.isNotEmpty) {
        candidateName = '$firstName $lastName';
      } else if (firstName.isNotEmpty) {
        candidateName = firstName;
      } else if (lastName.isNotEmpty) {
        candidateName = lastName;
      }
    }
    
    debugPrint('Final candidate name: $candidateName');

    return InkWell(
      onTap: () async {
        final result = await context.push(
          '/view-application/${application.id}?jobId=${widget.jobId}',
        );
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
                // Avatar
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: candidate?.avatarUrl != null &&
                          candidate!.avatarUrl!.isNotEmpty
                      ? ClipOval(
                          child: Image.network(
                            candidate.avatarUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  candidateName[0].toUpperCase(),
                                  style: AppTextStyles.heading2.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Text(
                            candidateName[0].toUpperCase(),
                            style: AppTextStyles.heading2.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    candidateName,
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, size: 16, color: statusColor),
                      const SizedBox(width: 4),
                      Text(
                        status,
                        style: AppTextStyles.caption.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
