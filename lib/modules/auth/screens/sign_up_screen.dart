import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/utils/message_helper.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_sign_up_button.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../../../shared/data/models/account_dto.dart';
import '../../../shared/data/dto/register_request.dart';
import '../../../shared/data/repositories/auth_repository.dart';
import '../../../app/config/service_locator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  Role _selectedRole = Role.candidate;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final request = RegisterRequest(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          provider: Provider.local,
          role: _selectedRole,
        );

        // Call real API
        final authRepository = getIt<AuthRepository>();
        final response = await authRepository.register(request);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message),
              backgroundColor: Colors.green,
            ),
          );

          // Navigate to verify screen with account info
          await Future.delayed(const Duration(seconds: 1));
          if (mounted && response.data != null) {
            context.goNamed(
              'verify',
              extra: {
                'accountId': response.data!.id,
                'email': _emailController.text.trim(),
              },
            );
          }
        }
      } catch (e) {
        if (mounted) {
          MessageHelper.showError(
            context,
            e,
            fallbackMessage: 'Registration failed',
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  void _handleGoogleSignUp() {
    // TODO: Implement Google Sign Up with provider = GOOGLE
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Google Sign Up - Coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Text(
                    'Create an Account',
                    style: AppTextStyles.heading1.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                // Role Selection Dropdown
                Text(
                  'I am a',
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.textTertiary.withOpacity(0.3),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Role>(
                      value: _selectedRole,
                      isExpanded: true,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.textTertiary,
                      ),
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      dropdownColor: AppColors.white,
                      onChanged: (Role? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedRole = newValue;
                          });
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: Role.candidate,
                          child: Text('Candidate (Job Seeker)'),
                        ),
                        DropdownMenuItem(
                          value: Role.employer,
                          child: Text('Employer (Recruiter)'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  label: 'Email',
                  hintText: 'haily@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hintText: '••••••••',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                        Text(
                          'Remember me',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to forgot password screen
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: AppColors.primary.withOpacity(
                        0.6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
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
                            'SIGN UP',
                            style: AppTextStyles.button.copyWith(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 15),
                SocialSignUpButton(onPressed: _handleGoogleSignUp),
                const SizedBox(height: 15),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "You already have an account? ",
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.accent,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.goNamed('sign-in'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
