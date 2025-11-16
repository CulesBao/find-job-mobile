import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class ActionButtonsWidget extends StatelessWidget {
  final bool isFollowing;
  final VoidCallback onFollowTap;
  final VoidCallback onVisitWebsiteTap;

  const ActionButtonsWidget({
    super.key,
    required this.isFollowing,
    required this.onFollowTap,
    required this.onVisitWebsiteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onFollowTap,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB2B2).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isFollowing ? Icons.check : Icons.add,
                      size: 16,
                      color: const Color(0xFFFC4646),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isFollowing ? 'Following' : 'Follow',
                      style: AppTextStyles.body.copyWith(
                        color: const Color(0xFFFC4646),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onVisitWebsiteTap,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.language,
                      size: 16,
                      color: Color(0xFFFC4646),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Visit website',
                      style: AppTextStyles.body.copyWith(
                        color: const Color(0xFFFC4646),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
