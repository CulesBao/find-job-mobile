import 'package:find_job_mobile/modules/setup/widgets/avatar_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/biography_sheet.dart';
import 'package:find_job_mobile/modules/setup/widgets/date_picker_field.dart';
import 'package:find_job_mobile/modules/setup/widgets/education_dropdown.dart';
import 'package:find_job_mobile/modules/setup/widgets/header_section.dart';
import 'package:find_job_mobile/modules/setup/widgets/location_dropdown.dart';
import 'package:find_job_mobile/modules/setup/widgets/social_link_section.dart';
import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_select.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedGender = 'male';
  final _birthdayController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _biographyController = TextEditingController();

  bool _isLoading = false;

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
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
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
              name: 'Dương Văn Tèo Con',
              location: 'Đập hải ly, Rừng rú',
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
                      controller: _nameController,
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
                      controller: _nameController,
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
                    EducationDropdown(onChanged: (value) {}),
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
                      onProvinceChanged: (province) {},
                      onDistrictChanged: (district) {},
                    ),
                    const SizedBox(height: 16),
                    SocialLinksSection(
                      onChanged: (links) {
                        print(
                          links.map(
                            (e) => {'platform': e.platform, 'url': e.url},
                          ),
                        );
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
                          onPressed: _isLoading
                              ? null
                              : () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    setState(() => _isLoading = true);
                                    try {
                                      // TODO: Call API to save profile
                                      await Future.delayed(
                                        const Duration(seconds: 1),
                                      ); // Simulate API call

                                      if (mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Profile updated successfully',
                                            ),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Failed to update profile: $e',
                                            ),
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
                                },
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
