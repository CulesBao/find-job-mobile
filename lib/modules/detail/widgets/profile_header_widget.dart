import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String location;
  final String phoneNumber;
  final String followerCount;
  final String followingCount;
  final VoidCallback? onBackTap;

  const ProfileHeaderWidget({
    super.key,
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.followerCount,
    required this.followingCount,
    required this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF6C5CE7), Color(0xFF130160)],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Top bar with share and settings icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onBackTap,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Profile image
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                color: const Color(0xFFAFECFE),
              ),
              child: const Center(
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            // Name
            Text(
              name,
              style: AppTextStyles.heading3.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            // Location
            Text(
              location,
              style: AppTextStyles.body.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            // Phone Number
            Text(
              phoneNumber,
              style: AppTextStyles.body.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            // Follower & Following (centered)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Follower
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: followerCount,
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' Follower',
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                // Following
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: followingCount,
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' Following',
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
