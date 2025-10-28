import 'package:find_job_mobile/modules/setup/services/employer_profile_service.dart';
import 'package:find_job_mobile/modules/setup/widgets/avatar_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/biography_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/company_profile_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/contact_info_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/header_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/save_button.dart';
import 'package:find_job_mobile/modules/setup/widgets/vision_field.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';

class SetupScreenEmployerProfile extends StatefulWidget {
  const SetupScreenEmployerProfile({super.key});

  @override
  State<SetupScreenEmployerProfile> createState() =>
      _SetupScreenEmployerProfileState();
}

class _SetupScreenEmployerProfileState
    extends State<SetupScreenEmployerProfile> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _establishedInController = TextEditingController();
  final _websiteController = TextEditingController();
  final _locationController = TextEditingController();
  final _aboutController = TextEditingController();
  final _visionController = TextEditingController();

  bool _isLoading = false;
  String? _selectedProvinceCode;
  String? _selectedDistrictCode;
  final _employerProfileService = EmployerProfileService();

  @override
  void initState() {
    super.initState();
    _loadCompanyData();
  }

  void _loadCompanyData() {
    final user = AuthHelper.currentUser;
    if (user != null) {}
  }

  void _showAddAboutSheet(BuildContext context) {
    BiographySheet.show(context, _aboutController).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _showChangeLogoSheet(BuildContext context) {
    AvatarSheet.show(
      context,
      onCameraTap: () {
        // TODO: Implement camera capture
      },
      onGalleryTap: () {
        // TODO: Implement gallery picker
      },
    );
  }

  Future<void> _handleSubmit() async {
    setState(() => _isLoading = true);

    try {
      final response = await _employerProfileService.createProfile(
        name: _companyNameController.text,
        establishedIn: _establishedInController.text,
        websiteUrl: _websiteController.text,
        provinceCode: _selectedProvinceCode!,
        districtCode: _selectedDistrictCode!,
        location: _locationController.text,
        about: _aboutController.text.isNotEmpty ? _aboutController.text : null,
        vision: _visionController.text.isNotEmpty
            ? _visionController.text
            : null,
      );

      if (mounted) {
        if (response.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile created successfully'),
              backgroundColor: Colors.green,
            ),
          );

          // TODO: Navigate to home screen
          await Future.delayed(const Duration(seconds: 1));
        } else {
          throw Exception(response.message);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create profile: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _establishedInController.dispose();
    _websiteController.dispose();
    _locationController.dispose();
    _aboutController.dispose();
    _visionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(
              name: AuthHelper.currentUser?.email ?? 'New Company',
              location: 'Setup your company profile',
              biography: _aboutController.text,
              onAvatarTap: () => _showChangeLogoSheet(context),
              onBiographyTap: () => _showAddAboutSheet(context),
              onSettingsTap: () {},
              onShareTap: () {},
            ),

            // Form container
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CompanyProfileSection(
                      companyNameController: _companyNameController,
                      establishedInController: _establishedInController,
                      websiteController: _websiteController,
                    ),

                    // Location
                    ContactInfoSection(
                      phoneController:
                          TextEditingController(), // Dummy controller
                      locationController: _locationController,
                      onProvinceChanged: (provinceCode) {
                        setState(() => _selectedProvinceCode = provinceCode);
                      },
                      onDistrictChanged: (districtCode) {
                        setState(() => _selectedDistrictCode = districtCode);
                      },
                      hidePhoneField: true,
                      showLocationField: true,
                    ),
                    const SizedBox(height: 16),

                    // Vision
                    VisionField(controller: _visionController),
                    const SizedBox(height: 24),

                    // Save Button
                    Center(
                      child: SaveButton(
                        onPressed: _handleSubmit,
                        isLoading: _isLoading,
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
