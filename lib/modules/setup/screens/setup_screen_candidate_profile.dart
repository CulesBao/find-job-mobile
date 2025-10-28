import 'package:find_job_mobile/modules/setup/widgets/avatar_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/biography_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/contact_info_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/education_dropdown.dart';
import 'package:find_job_mobile/modules/setup/widgets/header_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/personal_info_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/save_button.dart';
import 'package:find_job_mobile/modules/setup/widgets/social_link_section.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/modules/setup/services/candidate_profile_service.dart';
import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../widgets/gender_select.dart';

class SetupScreenCandidateProfile extends StatefulWidget {
  const SetupScreenCandidateProfile({super.key});

  @override
  State<SetupScreenCandidateProfile> createState() =>
      _SetupScreenCandidateProfileState();
}

class _SetupScreenCandidateProfileState
    extends State<SetupScreenCandidateProfile> {
  final _formKey = GlobalKey<FormState>();
  String _selectedGender = 'male';
  final _birthdayController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _biographyController = TextEditingController();

  bool _isLoading = false;
  String? _selectedProvinceCode;
  String? _selectedDistrictCode;
  String? _selectedEducation;
  List<Map<String, String>> _socialLinks = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final user = AuthHelper.currentUser;
    if (user != null) {}
  }

  Future<void> _handleSubmit() async {
    setState(() => _isLoading = true);

    try {
      final service = getIt<ProfileSetupService>();

      final response = await service.createProfile(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        provinceCode: _selectedProvinceCode!,
        districtCode: _selectedDistrictCode!,
        bio: _biographyController.text.isNotEmpty
            ? _biographyController.text
            : null,
        dateOfBirth: _birthdayController.text.isNotEmpty
            ? _birthdayController.text
            : null,
        education: _selectedEducation,
        gender: _selectedGender == 'male',
        phoneNumber: _phoneController.text.isNotEmpty
            ? _phoneController.text
            : null,
        socialLinks: _socialLinks,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
            backgroundColor: Colors.green,
          ),
        );

        // TODO: Navigate to home screen
        await Future.delayed(const Duration(seconds: 1));
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

  void _showAddBiographySheet(BuildContext context) {
    BiographySheet.show(context, _biographyController).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _showChangeAvatarSheet(BuildContext context) {
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

  @override
  void dispose() {
    _birthdayController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _biographyController.dispose();
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
              name: AuthHelper.currentUser?.email ?? 'New User',
              location: 'Setup your profile',
              biography: _biographyController.text,
              onAvatarTap: () => _showChangeAvatarSheet(context),
              onBiographyTap: () => _showAddBiographySheet(context),
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
                    Text(
                      'My Profile',
                      style: AppTextStyles.heading2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Personal Information Section
                    PersonalInfoSection(
                      firstNameController: _firstNameController,
                      lastNameController: _lastNameController,
                      birthdayController: _birthdayController,
                    ),

                    // Gender select
                    const SizedBox(height: 16),
                    Text('Gender', style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: GenderSelect(
                            label: 'Male',
                            selected: _selectedGender == 'male',
                            onTap: () =>
                                setState(() => _selectedGender = 'male'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GenderSelect(
                            label: 'Female',
                            selected: _selectedGender == 'female',
                            onTap: () =>
                                setState(() => _selectedGender = 'female'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Education select
                    EducationDropdown(
                      onChanged: (value) =>
                          setState(() => _selectedEducation = value),
                    ),
                    const SizedBox(height: 16),

                    // Contact Information Section
                    ContactInfoSection(
                      phoneController: _phoneController,
                      onProvinceChanged: (provinceCode) {
                        setState(() => _selectedProvinceCode = provinceCode);
                      },
                      onDistrictChanged: (districtCode) {
                        setState(() => _selectedDistrictCode = districtCode);
                      },
                    ),
                    const SizedBox(height: 16),

                    // Social Links Section
                    SocialLinksSection(
                      onChanged: (links) {
                        setState(() {
                          _socialLinks = links
                              .map(
                                (e) => {'platform': e.platform, 'url': e.url},
                              )
                              .toList();
                        });
                      },
                    ),
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
