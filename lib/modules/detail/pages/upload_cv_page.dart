import 'dart:io';
import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:find_job_mobile/modules/detail/widgets/upload_cv/job_info_header_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/upload_cv/upload_cv_section_widget.dart';
import 'package:find_job_mobile/modules/detail/widgets/upload_cv/information_section_widget.dart';

class UploadCvPage extends StatefulWidget {
  const UploadCvPage({super.key});

  @override
  State<UploadCvPage> createState() => _UploadCvPageState();
}

class _UploadCvPageState extends State<UploadCvPage> {
  File? _selectedFile;
  final TextEditingController _informationController = TextEditingController();

  @override
  void dispose() {
    _informationController.dispose();
    super.dispose();
  }

  void _applyNow() {
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

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Application submitted successfully!'),
        backgroundColor: AppColors.success,
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    const JobInfoHeaderWidget(
                      jobTitle: 'UI/UX Designer',
                      company: 'Google',
                      location: 'California',
                      timeAgo: '1 day ago',
                      logoUrl:
                          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
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
          onPressed: _applyNow,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
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
    );
  }
}
