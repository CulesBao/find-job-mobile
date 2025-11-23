import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/application_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/application_repository.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/shared/utils/application_status_utils.dart';
import 'package:intl/intl.dart';

class AppliedJobDetailPage extends StatefulWidget {
  final String applicationId;

  const AppliedJobDetailPage({
    super.key,
    required this.applicationId,
  });

  @override
  State<AppliedJobDetailPage> createState() => _AppliedJobDetailPageState();
}

class _AppliedJobDetailPageState extends State<AppliedJobDetailPage> {
  final _applicationRepository = getIt<ApplicationRepository>();

  bool _isLoading = true;
  ApplicationDto? _application;
  String? _errorMessage;
  bool _isWithdrawn = false; // Track withdrawn status manually
  bool _isWithdrawing = false; // Prevent multiple withdraw clicks

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
      debugPrint('=== Loading application details for ID: ${widget.applicationId}');
      final response = await _applicationRepository.getApplicationById(
        widget.applicationId,
      );

      debugPrint('=== Response success: ${response.success}');
      debugPrint('=== Response data: ${response.data}');
      debugPrint('=== Response message: ${response.message}');

      // Accept both success true and data not null
      if (response.data != null) {
        setState(() {
          _application = response.data;
        });
      } else {
        setState(() {
          _errorMessage = response.message.isNotEmpty 
              ? response.message 
              : 'Unable to load application details';
        });
      }
    } catch (e, stackTrace) {
      debugPrint('=== Error loading application details: $e');
      debugPrint('=== Stack trace: $stackTrace');
      setState(() {
        _errorMessage = 'Unable to load application details. Please try again.\n\nError: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _withdrawApplication() async {
    // Prevent multiple clicks
    if (_isWithdrawing || _isWithdrawn) {
      debugPrint('=== Already withdrawing or withdrawn, returning');
      return;
    }

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Withdraw Application',
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to withdraw this application? This action cannot be undone.',
          style: AppTextStyles.body.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Cancel',
              style: AppTextStyles.button.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: Text(
              'Withdraw',
              style: AppTextStyles.button.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // Set withdrawing flag
    setState(() {
      _isWithdrawing = true;
    });

    // Show loading
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      final response = await _applicationRepository.withdrawApplication(
        widget.applicationId,
      );

      if (mounted) {
        Navigator.of(context).pop(); // dismiss loading

        if (response.success) {
          // Mark as withdrawn locally
          debugPrint('=== Withdraw SUCCESS - Setting _isWithdrawn = true');
          
          setState(() {
            _isWithdrawn = true;
            _isWithdrawing = false;
            _application = _application!.copyWith(
              updatedAt: DateTime.now(),
            );
          });
          
          debugPrint('=== _isWithdrawn: $_isWithdrawn');

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Application withdrawn successfully'),
                backgroundColor: AppColors.success,
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          setState(() {
            _isWithdrawing = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('=== Withdraw ERROR: $e');
      
      if (mounted) {
        Navigator.of(context).pop(); // dismiss loading
        
        // Check if error is "already withdrawn" - treat as success
        final errorMessage = e.toString().toLowerCase();
        if (errorMessage.contains('already') && errorMessage.contains('withdrawn')) {
          debugPrint('=== Already withdrawn - Setting _isWithdrawn = true');
          
          setState(() {
            _isWithdrawn = true;
            _isWithdrawing = false;
            _application = _application!.copyWith(
              updatedAt: DateTime.now(),
            );
          });
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('This application has already been withdrawn'),
              backgroundColor: AppColors.accent,
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          setState(() {
            _isWithdrawing = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }

  Future<void> _copyCvUrl() async {
    if (_application?.cvUrl == null) return;

    await Clipboard.setData(ClipboardData(text: _application!.cvUrl!));
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('CV URL copied to clipboard'),
          backgroundColor: AppColors.success,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy \'at\' HH:mm').format(date);
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

    if (_errorMessage != null) {
      return Center(
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
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loadApplicationDetails,
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
      );
    }

    if (_application == null) {
      return Center(
        child: Text(
          'Application not found',
          style: AppTextStyles.body.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    // Debug: Print current job process
    debugPrint('=== Current jobProcess: ${_application!.jobProcess}');
    debugPrint('=== _isWithdrawn: $_isWithdrawn');
    
    // If manually marked as withdrawn, show withdrawn status
    final status = _isWithdrawn ? 'Withdrawn' : ApplicationStatusUtils.getStatusText(_application!.jobProcess);
    final statusColor = _isWithdrawn ? AppColors.error : ApplicationStatusUtils.getStatusColor(_application!.jobProcess);
    
    // Check if can withdraw (NOT manually withdrawn, NOT hired, NOT rejected, NOT withdrawn)
    final canWithdraw = !_isWithdrawn &&
        _application!.jobProcess != JobProcess.hired &&
        _application!.jobProcess != JobProcess.rejected &&
        _application!.jobProcess != JobProcess.withdrawn;
    
    debugPrint('=== canWithdraw: $canWithdraw');
    debugPrint('=== status: $status');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Application Status Card
          Container(
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _isWithdrawn ? Icons.block : ApplicationStatusUtils.getStatusIcon(_application!.jobProcess),
                    size: 28,
                    color: statusColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Application Status',
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
          ),

          const SizedBox(height: 20),

          // Application Timeline
          _buildSectionCard(
            'Application Timeline',
            Icons.timeline,
            [
              _buildInfoRow(
                'Applied On',
                _formatDate(_application!.createdAt),
                Icons.calendar_today,
              ),
              if (_application!.updatedAt != null &&
                  _application!.updatedAt != _application!.createdAt)
                _buildInfoRow(
                  'Last Updated',
                  _formatDate(_application!.updatedAt!),
                  Icons.update,
                ),
            ],
          ),

          const SizedBox(height: 20),

          // CV Section
          if (_application!.cvUrl != null)
            _buildSectionCard(
              'Resume/CV',
              Icons.description,
              [
                InkWell(
                  onTap: _copyCvUrl,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.picture_as_pdf,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'View Resume URL',
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Tap to copy URL',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.copy,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          const SizedBox(height: 20),

          // Cover Letter Section
          if (_application!.coverLetter != null)
            _buildSectionCard(
              'Cover Letter',
              Icons.mail,
              [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.textTertiary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    _application!.coverLetter!,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),

          const SizedBox(height: 32),

          // Withdraw Button
          if (canWithdraw)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _withdrawApplication,
                icon: const Icon(Icons.cancel_outlined, color: Colors.white),
                label: Text(
                  'Withdraw Application',
                  style: AppTextStyles.button.copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

          // Back to List button (shown when withdrawn)
          if (!canWithdraw && _isWithdrawn)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: Text(
                  'Back to Applied Jobs',
                  style: AppTextStyles.button.copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    String title,
    IconData icon,
    List<Widget> children,
  ) {
    return Container(
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: AppColors.textSecondary,
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
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
