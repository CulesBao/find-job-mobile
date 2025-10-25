import 'package:find_job_mobile/modules/setup/widgets/avatar_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/biography_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/date_picker_field.dart';
import 'package:find_job_mobile/modules/setup/widgets/education_dropdown.dart';
import 'package:find_job_mobile/modules/setup/widgets/header_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/location_dropdown.dart';
import 'package:find_job_mobile/modules/setup/widgets/social_link_section.dart';
import 'package:find_job_mobile/shared/data/dto/create_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/social_link_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_profile_repository.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../widgets/custom_text_field.dart';
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

  String _convertDateFormat(String dateStr) {
    // Convert "DD MMM YYYY" to "YYYY-MM-DD"
    try {
      final parts = dateStr.split(' ');
      if (parts.length != 3) return dateStr;

      final day = parts[0].padLeft(2, '0');
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      final monthIndex = months.indexOf(parts[1]) + 1;
      final month = monthIndex.toString().padLeft(2, '0');
      final year = parts[2];

      return '$year-$month-$day';
    } catch (e) {
      return dateStr;
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Validate required fields
    if (_selectedProvinceCode == null || _selectedDistrictCode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select province and district'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final repository = getIt<CandidateProfileRepository>();

      // Step 1: Create profile
      final profileRequest = CreateCandidateProfileRequest(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        provinceCode: _selectedProvinceCode!,
        districtCode: _selectedDistrictCode!,
        bio: _biographyController.text.isNotEmpty
            ? _biographyController.text.trim()
            : null,
        dateOfBirth: _birthdayController.text.isNotEmpty
            ? _convertDateFormat(_birthdayController.text)
            : null,
        education: _selectedEducation != null
            ? Education.values.firstWhere(
                (e) =>
                    e.name.toUpperCase() == _selectedEducation!.toUpperCase(),
                orElse: () => Education.highSchool,
              )
            : null,
        gender: _selectedGender == 'male',
        phoneNumber: _phoneController.text.isNotEmpty
            ? _phoneController.text.trim()
            : null,
      );

      final createResponse = await repository.createProfile(profileRequest);

      // Step 2: Update social links if any
      if (_socialLinks.isNotEmpty && createResponse.data != null) {
        final socialLinksRequest = UpdateSocialLinksRequest(
          socialLinks: _socialLinks
              .map(
                (link) => SocialLinkInput(
                  type: SocialLinkType.values.firstWhere(
                    (e) =>
                        e.name.toUpperCase() == link['platform']!.toUpperCase(),
                  ),
                  url: link['url']!,
                ),
              )
              .toList(),
        );

        await repository.updateSocialLinks(socialLinksRequest);
      }

      // Step 3: Get updated profile
      if (createResponse.data != null) {
        final profileResponse = await repository.getProfile(
          createResponse.data!.id,
        );

        if (profileResponse.data != null) {
          // Save to AuthHelper
          await AuthHelper.saveCandidateProfile(profileResponse.data!);
          debugPrint('Profile saved to storage');
        }
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(createResponse.message),
            backgroundColor: Colors.green,
          ),
        );

        // TODO: Navigate to home screen
        await Future.delayed(const Duration(seconds: 1));
      }
    } catch (e) {
      debugPrint('Profile creation error: $e');
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

                    // First name
                    Text('First name', style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _firstNameController,
                      hint: 'Enter your first name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Last name
                    Text('Last name', style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _lastNameController,
                      hint: 'Enter your last name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Date of birth
                    Text('Date of birth', style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    DatePickerField(
                      controller: _birthdayController,
                      hint: 'Enter or select your date of birth',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your date of birth';
                        }
                        try {
                          final parts = value.split(' ');
                          if (parts.length != 3) throw FormatException();

                          final day = int.parse(parts[0]);
                          if (day < 1 || day > 31) throw FormatException();

                          const months = [
                            'Jan',
                            'Feb',
                            'Mar',
                            'Apr',
                            'May',
                            'Jun',
                            'Jul',
                            'Aug',
                            'Sep',
                            'Oct',
                            'Nov',
                            'Dec',
                          ];
                          if (!months.contains(parts[1]))
                            throw FormatException();

                          final year = int.parse(parts[2]);
                          if (year < 1900 || year > DateTime.now().year)
                            throw FormatException();

                          return null;
                        } catch (e) {
                          return 'Please use format: DD MMM YYYY (e.g. 01 Jan 2000)';
                        }
                      },
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
                      onChanged: (value) {
                        setState(() => _selectedEducation = value);
                      },
                    ),
                    const SizedBox(height: 16),

                    // Phone number
                    Text('Phone number', style: AppTextStyles.label),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _phoneController,
                      hint: 'Enter your phone number',
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        final phoneRegex = RegExp(r'^\+?[\d\s-]+$');
                        if (!phoneRegex.hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      prefixIcon: Icon(
                        Icons.phone,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Location select
                    ProvinceDistrictSelector(
                      onProvinceChanged: (provinceCode) {
                        setState(() => _selectedProvinceCode = provinceCode);
                      },
                      onDistrictChanged: (districtCode) {
                        setState(() => _selectedDistrictCode = districtCode);
                      },
                    ),
                    const SizedBox(height: 16),
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

                    // Save button
                    Center(
                      child: Container(
                        width: 213,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF99ABC6).withOpacity(0.18),
                              blurRadius: 62,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 0,
                            minimumSize: const Size(213, 50),
                          ),
                          onPressed: _isLoading ? null : _handleSubmit,
                          child: _isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'SAVE',
                                  style: AppTextStyles.button.copyWith(
                                    color: Colors.white,
                                    letterSpacing: 0.84,
                                  ),
                                ),
                        ),
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
