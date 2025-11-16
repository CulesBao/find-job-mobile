import 'dart:io';

import 'package:find_job_mobile/modules/setup/widgets/avatar_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/biography_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/contact_info_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/education_dropdown.dart';
import 'package:find_job_mobile/modules/setup/widgets/header_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/personal_info_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/save_button.dart';
import 'package:find_job_mobile/modules/setup/widgets/social_link_section.dart'
    show SocialLink, SocialLinksSection;
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/shared/utils/message_helper.dart';
import 'package:find_job_mobile/shared/utils/image_picker_helper.dart';
import 'package:find_job_mobile/shared/utils/format_helper.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/modules/setup/services/candidate_profile_service.dart';
import 'package:find_job_mobile/shared/data/repositories/account_repository.dart';
import 'package:find_job_mobile/shared/data/models/account_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final _accountRepo = getIt<AccountRepository>();

  String _selectedGender = 'male';
  final _birthdayController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _biographyController = TextEditingController();

  bool _isLoading = false;
  bool _isLoadingAccount = true;
  String? _selectedProvinceCode;
  String? _selectedDistrictCode;
  String? _selectedEducation;
  List<Map<String, String>> _socialLinks = [];
  File? _avatarFile;
  AccountDto? _account;
  bool _isUpdateMode = false; // true if updating existing profile

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() => _isLoadingAccount = true);
    try {
      // First check if profile exists in local storage
      CandidateProfileDto? cand = AuthHelper.candidateProfile;

      // If not in local storage, try to get from API
      if (cand == null) {
        final resp = await _accountRepo.getMyAccount();
        final acc = resp.data;
        cand = acc?.candidateProfileDto;
        _account = acc;
      }

      // Debug logs
      print('🔍 Candidate profile exists: ${cand != null}');
      if (cand != null) {
        print('🔍 Profile loaded: ${cand.firstName} ${cand.lastName}');
      }

      setState(() {
        _isUpdateMode = cand != null;

        if (cand != null) {
          // Prefill existing data
          _firstNameController.text = cand.firstName;
          _lastNameController.text = cand.lastName;
          _phoneController.text = cand.phoneNumber ?? '';
          // Format date from API format to display format
          _birthdayController.text = FormatHelper.formatDateFromApi(
            cand.dateOfBirth,
          );
          _biographyController.text = cand.bio ?? '';
          _selectedGender = (cand.gender == true) ? 'male' : 'female';
          _selectedEducation = _educationToValue(cand.education);
          _selectedProvinceCode = cand.province?.code;
          _selectedDistrictCode = cand.district?.code;

          // Load social links if available
          if (cand.socialLinks != null && cand.socialLinks!.isNotEmpty) {
            _socialLinks = cand.socialLinks!
                .map(
                  (link) => {
                    'platform': link.type.name.toUpperCase(),
                    'url': link.url,
                  },
                )
                .toList();
          }
        }
      });
    } catch (e) {
      if (mounted) {
        MessageHelper.showError(
          context,
          e,
          fallbackMessage: 'Failed to load profile',
        );
      }
    } finally {
      setState(() => _isLoadingAccount = false);
    }
  }

  String _capitalizePlatform(String platform) {
    if (platform.isEmpty) return 'Facebook';
    return platform[0].toUpperCase() + platform.substring(1).toLowerCase();
  }

  String? _educationToValue(Education? education) {
    if (education == null) return null;
    switch (education) {
      case Education.highSchool:
        return 'HIGH_SCHOOL';
      case Education.intermediate:
        return 'INTERMEDIATE';
      case Education.graduation:
        return 'GRADUATION';
      case Education.masterDegree:
        return 'MASTER_DEGREE';
      case Education.bachelorDegree:
        return 'BACHELOR_DEGREE';
    }
  }

  Future<void> _handleSubmit() async {
    setState(() => _isLoading = true);

    try {
      final service = getIt<ProfileSetupService>();

      if (_isUpdateMode) {
        // Update existing profile
        await service.updateProfile(
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
          avatarFile: _avatarFile,
          socialLinks: _socialLinks,
        );

        if (mounted) {
          MessageHelper.showSuccess(context, 'Profile updated successfully');
          Navigator.of(context).pop(); // Go back to previous screen
        }
      } else {
        // Create new profile
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
          avatarFile: _avatarFile,
          socialLinks: _socialLinks,
        );

        if (mounted) {
          MessageHelper.showSuccess(context, response.message);

          // Navigate to splash screen after profile setup
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            context.go('/');
          }
        }
      }
    } catch (e) {
      if (mounted) {
        MessageHelper.showError(
          context,
          e,
          fallbackMessage: _isUpdateMode
              ? 'Failed to update profile'
              : 'Failed to create profile',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _pickImageFromCamera() async {
    // Close bottom sheet FIRST (always, even if user cancels)
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    try {
      final File? image = await ImagePickerHelper.pickFromCamera(
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 60,
      );

      if (image != null && mounted) {
        // Wait a frame before setState
        await Future.delayed(const Duration(milliseconds: 50));

        if (mounted) {
          setState(() {
            _avatarFile = image;
          });
        }
      }
    } on PermissionDeniedException catch (e) {
      if (mounted) {
        MessageHelper.showError(
          context,
          e,
          fallbackMessage:
              'Camera permission denied. Please enable it in settings.',
        );
      }
    } catch (e) {
      if (mounted) {
        MessageHelper.showError(
          context,
          e,
          fallbackMessage: 'Failed to capture image',
        );
      }
    }
  }

  Future<void> _pickImageFromGallery() async {
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    try {
      final File? image = await ImagePickerHelper.pickFromGallery(
        maxWidth: 300,
        maxHeight: 300,
        imageQuality: 60,
      );

      if (image != null && mounted) {
        // Wait a frame before setState
        await Future.delayed(const Duration(milliseconds: 50));

        if (mounted) {
          setState(() {
            _avatarFile = image;
          });
        }
      }
    } on PermissionDeniedException catch (e) {
      if (mounted) {
        MessageHelper.showError(
          context,
          e,
          fallbackMessage:
              'Gallery permission denied. Please enable it in settings.',
        );
      }
    } catch (e) {
      if (mounted) {
        MessageHelper.showError(
          context,
          e,
          fallbackMessage: 'Failed to pick image',
        );
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
      onCameraTap: _pickImageFromCamera,
      onGalleryTap: _pickImageFromGallery,
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
    if (_isLoadingAccount) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Background color fill for top area when in update mode
                if (_isUpdateMode)
                  Container(
                    height: 80,
                    color: AppColors.primary,
                  ),
                HeaderSection(
              name: _account?.candidateProfileDto != null
                  ? '${_account!.candidateProfileDto!.firstName} ${_account!.candidateProfileDto!.lastName}'
                  : AuthHelper.candidateProfile != null
                  ? '${AuthHelper.candidateProfile!.firstName} ${AuthHelper.candidateProfile!.lastName}'
                  : AuthHelper.currentUser?.email ?? 'New User',
              location: _isUpdateMode
                  ? 'Update your profile'
                  : 'Setup your profile',
              biography: _biographyController.text,
              avatarFile: _avatarFile,
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
                      initialValue: _selectedEducation,
                      onChanged: (value) =>
                          setState(() => _selectedEducation = value),
                    ),
                    const SizedBox(height: 16),

                    // Contact Information Section
                    ContactInfoSection(
                      phoneController: _phoneController,
                      initialProvinceCode: _selectedProvinceCode,
                      initialDistrictCode: _selectedDistrictCode,
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
                      initialLinks: _socialLinks
                          .map(
                            (link) => SocialLink(
                              platform: _capitalizePlatform(
                                link['platform'] ?? '',
                              ),
                              url: link['url'] ?? '',
                            ),
                          )
                          .toList(),
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
      // Back button overlay for update mode
      if (_isUpdateMode)
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 28,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 197, 203, 255),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.of(context).pop(),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
