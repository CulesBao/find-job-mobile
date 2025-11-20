import 'package:flutter/material.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/application_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/application_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:intl/intl.dart';

class ViewApplicationDetailPage extends StatefulWidget {
  final String applicationId;
  final String? jobId;

  const ViewApplicationDetailPage({
    super.key,
    required this.applicationId,
    this.jobId,
  });

  @override
  State<ViewApplicationDetailPage> createState() =>
      _ViewApplicationDetailPageState();
}

class _ViewApplicationDetailPageState extends State<ViewApplicationDetailPage> {
  final _applicationRepository = getIt<ApplicationRepository>();

  bool _isLoading = true;
  bool _isUpdatingStatus = false;
  ApplicationDto? _application;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadApplicationDetails();
  }

  Future<void> _loadApplicationDetails() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response =
          await _applicationRepository.getApplicationById(widget.applicationId);

      if (response.success || response.data != null) {
        setState(() {
          _application = response.data;
        });
      } else {
        setState(() {
          _errorMessage = response.message;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Unable to load application details. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _updateApplicationStatus(JobProcess newStatus) async {
    if (_application == null) return;

    // Debug logs
    print('=== Updating status ===');
    print('Application ID: ${widget.applicationId}');
    print('Job ID: ${_application!.jobId}');
    print('Current Status: ${_application!.jobProcess}');
    print('New Status: $newStatus');

    if (_application!.jobId == null || _application!.jobId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot update status: Job ID is missing'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Status'),
        content: Text(
            'Are you sure you want to change the status to ${_getStatusText(newStatus)}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
            ),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() {
      _isUpdatingStatus = true;
    });

    try {
      final response = await _applicationRepository.updateApplicationStatus(
        jobId: _application!.jobId ?? widget.jobId ?? '',
        applications: [
          {
            'application_id': widget.applicationId,
            'job_process': _getJobProcessString(newStatus),
          }
        ],
      );

      if (mounted) {
        if (response.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Application status updated successfully'),
              backgroundColor: AppColors.success,
            ),
          );
          // Reload to get updated data
          _loadApplicationDetails();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() {
        _isUpdatingStatus = false;
      });
    }
  }

  String _getJobProcessString(JobProcess status) {
    switch (status) {
      case JobProcess.pending:
        return 'PENDING';
      case JobProcess.reviewing:
        return 'REVIEWING';
      case JobProcess.interviewing:
        return 'INTERVIEWING';
      case JobProcess.accepted:
        return 'ACCEPTED';
      case JobProcess.rejected:
        return 'REJECTED';
      case JobProcess.withdrawn:
        return 'WITHDRAWN';
      case JobProcess.applicationSubmitted:
        return 'APPLICATION_SUBMITTED';
    }
  }

  String _getStatusText(JobProcess? status) {
    if (status == null) return 'Pending';
    switch (status) {
      case JobProcess.pending:
        return 'Pending';
      case JobProcess.reviewing:
        return 'Reviewing';
      case JobProcess.interviewing:
        return 'Interviewing';
      case JobProcess.accepted:
        return 'Accepted';
      case JobProcess.rejected:
        return 'Rejected';
      case JobProcess.withdrawn:
        return 'Withdrawn';
      case JobProcess.applicationSubmitted:
        return 'Submitted';
    }
  }

  Color _getStatusColor(JobProcess? status) {
    if (status == null) return AppColors.accent;
    switch (status) {
      case JobProcess.pending:
      case JobProcess.applicationSubmitted:
        return AppColors.accent;
      case JobProcess.reviewing:
        return const Color(0xFF1890FF);
      case JobProcess.interviewing:
        return AppColors.primary;
      case JobProcess.accepted:
        return AppColors.success;
      case JobProcess.rejected:
      case JobProcess.withdrawn:
        return AppColors.error;
    }
  }

  IconData _getStatusIcon(JobProcess? status) {
    if (status == null) return Icons.schedule;
    switch (status) {
      case JobProcess.pending:
      case JobProcess.applicationSubmitted:
        return Icons.schedule;
      case JobProcess.reviewing:
        return Icons.visibility;
      case JobProcess.interviewing:
        return Icons.people;
      case JobProcess.accepted:
        return Icons.check_circle;
      case JobProcess.rejected:
        return Icons.cancel;
      case JobProcess.withdrawn:
        return Icons.block;
    }
  }

  Future<void> _openCVUrl(String url) async {
    // Show a dialog with the CV URL
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('CV URL'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('CV is available at:'),
            const SizedBox(height: 8),
            SelectableText(
              url,
              style: const TextStyle(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
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
          onPressed: () => Navigator.pop(context, true),
        ),
        title: Text(
          'Application Details',
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null || _application == null) {
      return Center(
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
                _errorMessage ?? 'Application not found',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadApplicationDetails,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(),
          const SizedBox(height: 20),
          _buildCandidateInfoCard(),
          const SizedBox(height: 20),
          _buildCoverLetterCard(),
          const SizedBox(height: 20),
          _buildCVCard(),
          const SizedBox(height: 20),
          _buildUpdateStatusSection(),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    final status = _getStatusText(_application!.jobProcess);
    final statusColor = _getStatusColor(_application!.jobProcess);
    final statusIcon = _getStatusIcon(_application!.jobProcess);

    return Container(
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(statusIcon, color: statusColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Status',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: AppTextStyles.heading3.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCandidateInfoCard() {
    final candidate = _application!.candidateProfile;
    if (candidate == null) {
      return const SizedBox.shrink();
    }

    final candidateName = '${candidate.firstName} ${candidate.lastName}';

    return Container(
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
          Text(
            'Candidate Information',
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: candidate.avatarUrl != null &&
                        candidate.avatarUrl!.isNotEmpty
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
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      candidateName,
                      style: AppTextStyles.heading3.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (candidate.phoneNumber != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        candidate.phoneNumber!,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          if (candidate.phoneNumber != null)
            _buildInfoRow(
              Icons.phone,
              'Phone',
              candidate.phoneNumber!,
            ),
          if (candidate.phoneNumber != null) const SizedBox(height: 12),
          if (candidate.province != null)
            _buildInfoRow(
              Icons.location_on,
              'Location',
              '${candidate.district?.name ?? ''}, ${candidate.province!.name}',
            ),
          if (candidate.province != null) const SizedBox(height: 12),
          if (candidate.dateOfBirth != null)
            _buildInfoRow(
              Icons.cake,
              'Date of Birth',
              candidate.dateOfBirth!,
            ),
          if (candidate.dateOfBirth != null) const SizedBox(height: 12),
          _buildInfoRow(
            Icons.calendar_today,
            'Applied On',
            DateFormat('MMM dd, yyyy').format(_application!.createdAt),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCoverLetterCard() {
    final coverLetter = _application!.coverLetter;
    if (coverLetter == null || coverLetter.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
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
              const Icon(
                Icons.description,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Cover Letter',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            coverLetter,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCVCard() {
    final cvUrl = _application!.cvUrl;
    if (cvUrl == null || cvUrl.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
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
              const Icon(
                Icons.insert_drive_file,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Resume/CV',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _openCVUrl(cvUrl),
            icon: const Icon(Icons.open_in_browser),
            label: const Text('View CV URL'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateStatusSection() {
    // Don't show update status for withdrawn applications
    if (_application!.jobProcess == JobProcess.withdrawn) {
      return const SizedBox.shrink();
    }

    return Container(
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
          Text(
            'Update Application Status',
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildStatusButton(JobProcess.pending),
              _buildStatusButton(JobProcess.reviewing),
              _buildStatusButton(JobProcess.interviewing),
              _buildStatusButton(JobProcess.accepted),
              _buildStatusButton(JobProcess.rejected),
            ],
          ),
          if (_isUpdatingStatus)
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusButton(JobProcess status) {
    final isCurrentStatus = _application!.jobProcess == status;
    final statusText = _getStatusText(status);
    final statusColor = _getStatusColor(status);

    return ElevatedButton(
      onPressed: isCurrentStatus || _isUpdatingStatus
          ? null
          : () => _updateApplicationStatus(status),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isCurrentStatus ? statusColor : statusColor.withValues(alpha: 0.1),
        foregroundColor: isCurrentStatus ? Colors.white : statusColor,
        disabledBackgroundColor: statusColor.withValues(alpha: 0.5),
        disabledForegroundColor: Colors.white,
        elevation: isCurrentStatus ? 2 : 0,
      ),
      child: Text(statusText),
    );
  }
}
