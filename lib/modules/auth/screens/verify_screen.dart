import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../../../shared/data/repositories/auth_repository.dart';
import '../../../app/config/service_locator.dart';

class VerifyScreen extends StatefulWidget {
  final String accountId;
  final String email;

  const VerifyScreen({
    super.key,
    required this.accountId,
    required this.email,
  });

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    5,
    (_) => FocusNode(),
  );
  bool _isLoading = false;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String _getVerificationCode() {
    return _controllers.map((c) => c.text).join();
  }

  bool _isCodeComplete() {
    return _controllers.every((c) => c.text.isNotEmpty);
  }

  Future<void> _handleVerify() async {
    if (!_isCodeComplete()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter complete verification code'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final code = _getVerificationCode();
      final authRepository = getIt<AuthRepository>();
      final response = await authRepository.verifyCode(widget.accountId, code);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
            backgroundColor: AppColors.success,
          ),
        );

        // Navigate to sign-in or home screen after successful verification
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          context.goNamed('sign-in');
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Verification failed: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleResend() async {
    // TODO: Implement resend verification code API call
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Verification code has been resent'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              
              // Title
              Text(
                'Check Your Email',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              
              // Description
              Text(
                'We have sent the reset password to the email address\n${widget.email}',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              
              // Email illustration
              Image.asset(
                'assets/images/email_sent.png',
                height: 180,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.email_outlined,
                      size: 80,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
              const SizedBox(height: 60),
              
              // Verification code input boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: index < 4 ? 10 : 0,
                    ),
                    child: _buildCodeBox(index),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // Verify button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleVerify,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'VERIFY',
                          style: AppTextStyles.button.copyWith(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Back to login button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: _isLoading
                      ? null
                      : () => context.goNamed('sign-in'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(
                      color: AppColors.secondary,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'BACK TO LOGIN',
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Resend link
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                  children: [
                    const TextSpan(
                      text: 'You have not received the email?  ',
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: _isLoading ? null : _handleResend,
                        child: Text(
                          'Resend',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.accent,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.accent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeBox(int index) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _focusNodes[index].hasFocus
              ? AppColors.primary
              : AppColors.secondary,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: AppTextStyles.heading2.copyWith(
          color: AppColors.textPrimary,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.isNotEmpty) {
            // Move to next field
            if (index < 4) {
              _focusNodes[index + 1].requestFocus();
            } else {
              // Last field, unfocus to hide keyboard
              _focusNodes[index].unfocus();
            }
          } else {
            // Move to previous field on backspace
            if (index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
          }
          setState(() {}); // Rebuild to update button state
        },
      ),
    );
  }
}
