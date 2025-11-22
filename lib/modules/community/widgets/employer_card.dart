import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_follower_repository.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/modules/detail/pages/employer_detail_page.dart';

class EmployerCard extends StatefulWidget {
  const EmployerCard({super.key, required this.employer});

  final EmployerProfileDto employer;

  @override
  State<EmployerCard> createState() => _EmployerCardState();
}

class _EmployerCardState extends State<EmployerCard> {
  bool? _isFollowed;
  final _candidateFollowerRepo = getIt<CandidateFollowerRepository>();

  @override
  void initState() {
    super.initState();
    _initFollowState();
  }

  Future<void> _initFollowState() async {
    if (!AuthHelper.isCandidate) return;
    try {
      final resp = await _candidateFollowerRepo.isFollowed(widget.employer.id);
      if (mounted && resp.data != null) {
        setState(() => _isFollowed = resp.data);
      }
    } catch (e) {
      debugPrint('Failed to check follow state: $e');
    }
  }

  Future<void> _toggleFollow() async {
    if (!AuthHelper.isCandidate) return;
    final id = widget.employer.id;
    try {
      if (_isFollowed == true) {
        await _candidateFollowerRepo.unfollowEmployer(id);
        if (mounted) setState(() => _isFollowed = false);
        if (mounted)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Unfollowed ${widget.employer.name}')),
          );
      } else {
        await _candidateFollowerRepo.followEmployer(id);
        if (mounted) setState(() => _isFollowed = true);
        if (mounted)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Followed ${widget.employer.name}')),
          );
      }
    } catch (e) {
      debugPrint('Follow action failed: $e');
      if (mounted)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Action failed: ${e.toString()}')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final employer = widget.employer;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmployerDetailPage(employerId: employer.id),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.textTertiary.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Avatar/Logo
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(16),
                image: employer.logoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(employer.logoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: employer.logoUrl == null
                  ? const Icon(
                      Icons.business,
                      color: AppColors.primary,
                      size: 32,
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            // Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employer.name,
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          employer.displayLocation,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (employer.about != null)
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 16,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            employer.about!,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textTertiary,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                _isFollowed == true ? Icons.bookmark : Icons.bookmark_outline,
                color: AppColors.primary,
              ),
              onPressed: AuthHelper.isCandidate ? _toggleFollow : null,
              tooltip: AuthHelper.isCandidate
                  ? (_isFollowed == true ? 'Unfollow' : 'Follow')
                  : 'Only candidates can follow',
            ),
          ],
        ),
      ),
    );
  }
}
