import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class RelativeCandidatesSectionWidget extends StatelessWidget {
  final List<CandidateCardData> candidates;
  final void Function(String?)? onCandidateTap;

  const RelativeCandidatesSectionWidget({
    super.key, 
    required this.candidates,
    this.onCandidateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9228).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.people_outline,
                  color: Color(0xFFFF9228),
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Relative Candidates',
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF150B3D),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.grey[300], height: 1),
          const SizedBox(height: 20),
          ...candidates.map(
            (candidate) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _CandidateCard(
                data: candidate,
                onTap: onCandidateTap != null
                    ? () => onCandidateTap!(candidate.candidateId)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CandidateCardData {
  final String name;
  final String position;
  final String location;
  final String? candidateId;
  final String? avatarUrl;

  const CandidateCardData({
    required this.name,
    required this.position,
    required this.location,
    this.candidateId,
    this.avatarUrl,
  });
}

class _CandidateCard extends StatelessWidget {
  final CandidateCardData data;
  final VoidCallback? onTap;

  const _CandidateCard({required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: Row(
          children: [
          // Candidate Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFAFECFE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: data.avatarUrl != null && data.avatarUrl!.isNotEmpty
                  ? Image.network(
                      data.avatarUrl!,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.person, size: 24, color: Colors.white),
                        );
                      },
                    )
                  : const Center(
                      child: Icon(Icons.person, size: 24, color: Colors.white),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          // Candidate Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: AppTextStyles.body.copyWith(
                    color: const Color(0xFF150B3D),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.position,
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF524B6B),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.location,
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF8983A3),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          // Arrow Icon
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
        ],
      ),
      ),
    );
  }
}
