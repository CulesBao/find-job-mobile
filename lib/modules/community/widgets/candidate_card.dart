import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_filter_dto.dart';
import 'package:find_job_mobile/shared/styles/colors.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_follower_repository.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/modules/detail/pages/candidate_detail_page.dart';

class CandidateCard extends StatefulWidget {
  const CandidateCard({super.key, required this.candidate});

  final CandidateFilterDto candidate;

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  bool? _isFollowed;
  final _employerFollowerRepo = getIt<EmployerFollowerRepository>();

  @override
  void initState() {
    super.initState();
    _initFollowState();
  }

  Future<void> _initFollowState() async {
    // only employers can follow candidates
    if (!AuthHelper.isEmployer) return;
    try {
      final resp = await _employerFollowerRepo.isFollowed(widget.candidate.id);
      if (mounted && resp.data != null) {
        setState(() => _isFollowed = resp.data);
      }
    } catch (e) {
      debugPrint('Failed to check follow state: $e');
    }
  }

  Future<void> _toggleFollow() async {
    if (!AuthHelper.isEmployer) return;
    final id = widget.candidate.id;
    try {
      if (_isFollowed == true) {
        await _employerFollowerRepo.unfollowCandidate(id);
        if (mounted) setState(() => _isFollowed = false);
        if (mounted)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Unfollowed ${widget.candidate.firstName}')),
          );
      } else {
        await _employerFollowerRepo.followCandidate(id);
        if (mounted) setState(() => _isFollowed = true);
        if (mounted)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Followed ${widget.candidate.firstName}')),
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

  String _getEducationLabel(Education? education) {
    switch (education) {
      case Education.highSchool:
        return 'High School';
      case Education.intermediate:
        return 'Intermediate';
      case Education.graduation:
        return 'Graduation';
      case Education.bachelorDegree:
        return 'Bachelor Degree';
      case Education.masterDegree:
        return 'Master Degree';
      default:
        return 'Not specified';
    }
  }

  @override
  Widget build(BuildContext context) {
    final candidate = widget.candidate;
    final fullName = '${candidate.firstName} ${candidate.lastName}';

    final location = candidate.location ?? 'Not specified';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CandidateDetailPage(candidateId: candidate.id),
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
            // Avatar
            CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.secondary.withValues(alpha: 0.3),
              backgroundImage: candidate.avatarUrl != null
                  ? NetworkImage(candidate.avatarUrl!)
                  : null,
              child: candidate.avatarUrl == null
                  ? Text(
                      candidate.firstName[0].toUpperCase(),
                      style: AppTextStyles.heading2.copyWith(
                        color: AppColors.primary,
                      ),
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
                    fullName,
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getEducationLabel(candidate.education),
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        candidate.gender == false
                            ? Icons.male
                            : candidate.gender == true
                            ? Icons.female
                            : Icons.help_outline,
                        size: 16,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        candidate.gender == false
                            ? 'Male'
                            : candidate.gender == true
                            ? 'Female'
                            : 'Not specified',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textTertiary,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textTertiary,
                            fontSize: 12,
                          ),
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
                // show bookmark when followed
                _isFollowed == true ? Icons.bookmark : Icons.bookmark_outline,
                color: AppColors.primary,
              ),
              onPressed: AuthHelper.isEmployer ? _toggleFollow : null,
              tooltip: AuthHelper.isEmployer
                  ? (_isFollowed == true ? 'Unfollow' : 'Follow')
                  : 'Only employers can follow',
            ),
          ],
        ),
      ),
    );
  }
}
