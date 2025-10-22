import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';

class SocialSignUpButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const SocialSignUpButton({
    super.key,
    this.onPressed,
    this.text = 'SIGN UP WITH GOOGLE',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.google, semanticLabel: 'Google'),
            const SizedBox(width: 10),
            Text(
              text,
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
