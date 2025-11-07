import 'dart:io';

import 'package:find_job_mobile/modules/setup/services/employer_profile_service.dart';
import 'package:find_job_mobile/modules/setup/widgets/avatar_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/biography_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/company_profile_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/contact_info_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/header_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/save_button.dart';
import 'package:find_job_mobile/modules/setup/widgets/social_link_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/vision_field.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/shared/utils/image_picker_helper.dart';
import 'package:find_job_mobile/shared/utils/message_helper.dart';
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
  final _companyNameController = TextEditingController();
  final _establishedInController = TextEditingController();
  final _websiteController = TextEditingController();
  final _locationController = TextEditingController();
  final _aboutController = TextEditingController();
  final _visionController = TextEditingController();

  bool _isLoading = false;
  String? _selectedProvinceCode;
  String? _selectedDistrictCode;
  File? _logoFile;
  List<Map<String, String>> _socialLinks = [];
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
    } catch (e) {
      if (mounted) {
        MessageHelper.showError(
          context,
          e,
          fallbackMessage: 'Failed to create profile',
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
