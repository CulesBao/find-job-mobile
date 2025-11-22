import 'dart:io';
import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/modules/detail/widgets/upload_cv/job_info_header_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/upload_cv/upload_cv_section_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/upload_cv/information_section_widget.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/repositories/job_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/application_repository.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';

class UploadCvPage extends StatefulWidget {
  final String jobId;

  const UploadCvPage({super.key, required this.jobId});

  @override
  State<UploadCvPage> createState() => _UploadCvPageState();
}

class _UploadCvPageState extends State<UploadCvPage> {
  File? _selectedFile;
  final TextEditingController _informationController = TextEditingController();
  final _jobRepository = getIt<JobRepository>();
  final _applicationRepository = getIt<ApplicationRepository>();

  bool _isLoading = true;
  bool _isSubmitting = false;
  JobDto? _job;

  @override
  void initState() {
    super.initState();
    _loadJobData();
  }

  Future<void> _loadJobData() async {
    try {
      final response = await _jobRepository.getJobById(widget.jobId);
      if (mounted) {
        setState(() {
          _job = response.data;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load job: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _informationController.dispose();
    super.dispose();
  }

  Future<void> _applyNow() async {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload your CV/Resume'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_informationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please provide information about yourself'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await _applicationRepository.createApplication(
        resumeFile: _selectedFile!,
        coverLetter: _informationController.text.trim(),
        jobId: widget.jobId,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Application submitted successfully!'),
            backgroundColor: AppColors.success,
          ),
        );

        // Navigate back with success result using Navigator.of to ensure proper return value
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.of(context).pop(true); // Return true to indicate success
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit application: $e'),
            backgroundColor: AppColors.error,
          ),
        );
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
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work_off_outlined,
                          size: 64,
                          color: AppColors.textTertiary.withValues(alpha: 0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Job Not Found',
                          style: AppTextStyles.heading2.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'The job you are trying to apply for could not be found.\nIt may have been removed or expired.',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
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
                            'Go Back',
                            style: AppTextStyles.button.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    JobInfoHeaderWidget(
                      jobTitle: _job?.title ?? 'Job Title',
                      company: _job?.companyName ?? 'Company',
                      logoUrl: _job?.companyLogo,
                    ),
                    const SizedBox(height: 14),
                    UploadCvSectionWidget(
                      onFileSelected: (file, fileName) {
                        setState(() {
                          _selectedFile = file;
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    InformationSectionWidget(
                      controller: _informationController,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
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

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 16),
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
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: _isSubmitting ? null : _applyNow,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 0,
          ),
          child: _isSubmitting
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
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
    );
  }
}
