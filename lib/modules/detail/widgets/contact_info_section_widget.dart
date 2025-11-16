import 'package:flutter/material.dart';
import 'package:find_job_mobile/shared/styles/text_styles.dart';

class ContactInfoSectionWidget extends StatelessWidget {
  final String phoneNumber;
  final List<SocialLinkData> socialLinks;

  const ContactInfoSectionWidget({
    super.key,
    required this.phoneNumber,
    required this.socialLinks,
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
                  Icons.contact_page_outlined,
                  color: Color(0xFFFF9228),
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Contact Information',
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

          // Phone Number
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9228).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.phone,
                  color: Color(0xFFFF9228),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone Number',
                    style: AppTextStyles.body.copyWith(
                      color: const Color(0xFF524B6B),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phoneNumber,
                    style: AppTextStyles.body.copyWith(
                      color: const Color(0xFF150B3D),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Social Links Section
          Text(
            'Social Links',
            style: AppTextStyles.body.copyWith(
              color: const Color(0xFF150B3D),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),

          ...socialLinks.map(
            (link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _SocialLinkItem(data: link),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialLinkData {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const SocialLinkData({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
}

class _SocialLinkItem extends StatelessWidget {
  final SocialLinkData data;

  const _SocialLinkItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: data.color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(data.icon, color: data.color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.label,
                style: AppTextStyles.body.copyWith(
                  color: const Color(0xFF524B6B),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                data.value,
                style: AppTextStyles.body.copyWith(
                  color: data.color,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
      ],
    );
  }
}
