import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class UploadCvSectionWidget extends StatefulWidget {
  final Function(File?, String?) onFileSelected;

  const UploadCvSectionWidget({super.key, required this.onFileSelected});

  @override
  State<UploadCvSectionWidget> createState() => _UploadCvSectionWidgetState();
}

class _UploadCvSectionWidgetState extends State<UploadCvSectionWidget> {
  File? _selectedFile;
  String? _fileName;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
          _fileName = result.files.single.name;
        });

        widget.onFileSelected(_selectedFile, _fileName);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected: $_fileName'),
              backgroundColor: AppColors.success,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to pick file'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload CV',
            style: AppTextStyles.heading3.copyWith(
              color: const Color(0xFF150B3D),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Add your CV/Resume to apply for a job',
            style: AppTextStyles.body.copyWith(
              color: const Color(0xFF524B6B),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _pickFile,
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.attach_file,
                    size: 24,
                    color: Color(0xFF150B3D),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      _fileName ?? 'Upload CV/Resume',
                      style: AppTextStyles.body.copyWith(
                        color: const Color(0xFF150B3D),
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  if (_selectedFile != null) ...[
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.check_circle,
                      size: 20,
                      color: AppColors.success,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
