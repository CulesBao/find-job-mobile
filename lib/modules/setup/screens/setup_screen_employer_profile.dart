import 'dart:io';

import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/modules/setup/services/employer_profile_service.dart';
import 'package:find_job_mobile/modules/setup/widgets/avatar_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/biography_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/company_profile_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/contact_info_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/header_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/save_button.dart';
import 'package:find_job_mobile/modules/setup/widgets/social_link_section.dart'
    show SocialLink, SocialLinksSection;
import 'package:find_job_mobile/modules/setup/widgets/vision_field.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/shared/utils/image_picker_helper.dart';
import 'package:find_job_mobile/shared/utils/message_helper.dart';
import 'package:find_job_mobile/shared/utils/format_helper.dart';
import 'package:find_job_mobile/shared/data/repositories/account_repository.dart';
import 'package:find_job_mobile/shared/data/models/account_dto.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/social_link_dto.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final _accountRepo = getIt<AccountRepository>();
  final _companyNameController = TextEditingController();
  final _establishedInController = TextEditingController();
  final _websiteController = TextEditingController();
  final _locationController = TextEditingController();
  final _aboutController = TextEditingController();
  final _visionController = TextEditingController();

  bool _isLoading = false;
  bool _isLoadingAccount = true;
  String? _selectedProvinceCode;
  String? _selectedDistrictCode;
  File? _logoFile;
  List<Map<String, String>> _socialLinks = [];
  AccountDto? _account;
  bool _isUpdateMode = false;
  final _employerProfileService = EmployerProfileService();

  @override
  void initState() {
    super.initState();
    _loadCompanyData();
  }

  Future<void> _loadCompanyData() async {
    setState(() => _isLoadingAccount = true);
    try {
      // First check if profile exists in local storage
      EmployerProfileDto? emp = AuthHelper.employerProfile;

      // If not in local storage, try to get from API
      if (emp == null) {
        final resp = await _accountRepo.getMyAccount();
        final acc = resp.data;
        emp = acc?.employerProfileDto;
        _account = acc;
      }

      // Debug logs
      print('🔍 Employer profile exists: ${emp != null}');
      if (emp != null) {
        print('🔍 Profile loaded: ${emp.name}');
      }

      setState(() {
        _isUpdateMode = emp != null;

        if (emp != null) {
          // Prefill existing data
          _companyNameController.text = emp.name;
          _websiteController.text = emp.websiteUrl ?? '';
          // Format date from API format to display format
          _establishedInController.text = FormatHelper.formatDateFromApi(
            emp.establishedIn,
          );
          _aboutController.text = emp.about ?? '';
          _visionController.text = emp.vision ?? '';
          _locationController.text = ''; // Location not in DTO
          _selectedProvinceCode = emp.province?.code;
          _selectedDistrictCode = emp.district?.code;

          // Load social links if available
          if (emp.socialLinks != null && emp.socialLinks!.isNotEmpty) {
            _socialLinks = emp.socialLinks!
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
      onCameraTap: _pickImageFromCamera,
      onGalleryTap: _pickImageFromGallery,
    );
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
            _logoFile = image;
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
            _logoFile = image;
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

  Future<void> _handleSubmit() async {
    setState(() => _isLoading = true);

    try {
      if (_isUpdateMode) {
        // Update existing profile
        await _employerProfileService.updateProfile(
          name: _companyNameController.text,
          establishedIn: _establishedInController.text,
          websiteUrl: _websiteController.text,
          provinceCode: _selectedProvinceCode!,
          districtCode: _selectedDistrictCode!,
          location: _locationController.text,
          about: _aboutController.text.isNotEmpty
              ? _aboutController.text
              : null,
          vision: _visionController.text.isNotEmpty
              ? _visionController.text
              : null,
          logoFile: _logoFile,
          socialLinks: _socialLinks.isNotEmpty
              ? _socialLinks
                    .map(
                      (link) => SocialLinkInput(
                        type: SocialLinkType.values.firstWhere(
                          (e) =>
                              e.name.toUpperCase() ==
                              link['platform']!.toUpperCase(),
                        ),
                        url: link['url']!,
                      ),
                    )
                    .toList()
              : null,
        );

        if (mounted) {
          MessageHelper.showSuccess(context, 'Profile updated successfully');
          Navigator.of(context).pop(); // Go back to previous screen
        }
      } else {
        // Create new profile
        final response = await _employerProfileService.createProfile(
          name: _companyNameController.text,
          establishedIn: _establishedInController.text,
          websiteUrl: _websiteController.text,
          provinceCode: _selectedProvinceCode!,
          districtCode: _selectedDistrictCode!,
          location: _locationController.text,
          about: _aboutController.text.isNotEmpty
              ? _aboutController.text
              : null,
          vision: _visionController.text.isNotEmpty
              ? _visionController.text
              : null,
          logoFile: _logoFile,
          socialLinks: _socialLinks.isNotEmpty
              ? _socialLinks
                    .map(
                      (link) => SocialLinkInput(
                        type: SocialLinkType.values.firstWhere(
                          (e) =>
                              e.name.toUpperCase() ==
                              link['platform']!.toUpperCase(),
                        ),
                        url: link['url']!,
                      ),
                    )
                    .toList()
              : null,
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
              name:
                  _account?.employerProfileDto?.name ??
                  AuthHelper.employerProfile?.name ??
                  AuthHelper.currentUser?.email ??
                  'New Company',
              location: _isUpdateMode
                  ? 'Update your company profile'
                  : 'Setup your company profile',
              biography: _aboutController.text,
              avatarFile: _logoFile,
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
                      initialProvinceCode: _selectedProvinceCode,
                      initialDistrictCode: _selectedDistrictCode,
                      onProvinceChanged: (provinceCode) {
                        setState(() => _selectedProvinceCode = provinceCode);
                      },
                      onDistrictChanged: (districtCode) {
                        setState(() => _selectedDistrictCode = districtCode);
                      },
                      hidePhoneField: true,
                    ),
                    const SizedBox(height: 16),

                    // Vision
                    VisionField(controller: _visionController),
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
