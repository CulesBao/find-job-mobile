import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';

class SocialLink {
  String platform;
  String url;
  SocialLink({required this.platform, this.url = ''});
}

class SocialLinksSection extends StatefulWidget {
  final List<SocialLink> initialLinks;
  final ValueChanged<List<SocialLink>>? onChanged;

  const SocialLinksSection({
    super.key,
    this.initialLinks = const [],
    this.onChanged,
  });

  @override
  State<SocialLinksSection> createState() => _SocialLinksSectionState();
}

class _SocialLinksSectionState extends State<SocialLinksSection> {
  late List<SocialLink> _socialLinks;

  final List<String> _socialOptions = [
    'Facebook',
    'Email',
    'LinkedIn',
    'GitHub',
    'Instagram',
    'X',
    'YouTube',
  ];

  @override
  void initState() {
    super.initState();
    _socialLinks = List.from(widget.initialLinks);
  }

  IconData _getPlatformIcon(String platform) {
    switch (platform) {
      case 'Facebook':
        return FontAwesomeIcons.facebookF;
      case 'Email':
        return Icons.email_outlined;
      case 'LinkedIn':
        return FontAwesomeIcons.linkedinIn;
      case 'GitHub':
        return FontAwesomeIcons.github;
      case 'Instagram':
        return FontAwesomeIcons.instagram;
      case 'X':
        return FontAwesomeIcons.xTwitter;
      case 'YouTube':
        return FontAwesomeIcons.youtube;
      default:
        return Icons.link;
    }
  }

  void _notifyChange() {
    if (widget.onChanged != null) widget.onChanged!(_socialLinks);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Social Links', style: AppTextStyles.label),
        const SizedBox(height: 8),
        if (_socialLinks.isNotEmpty)
          Column(
            children: [
              for (int i = 0; i < _socialLinks.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _socialLinks[i].platform,
                              icon: const Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              items: _socialOptions.map((platform) {
                                return DropdownMenuItem(
                                  value: platform,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        _getPlatformIcon(platform),
                                        size: 14,
                                        color: AppColors.textPrimary,
                                      ),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          platform,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyles.body.copyWith(
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _socialLinks[i].platform = value;
                                    _notifyChange();
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 48,
                          child: TextFormField(
                            initialValue: _socialLinks[i].url,
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.textPrimary,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Profile link/url...',
                              hintStyle: AppTextStyles.body.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              _socialLinks[i].url = value;
                              _notifyChange();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            _socialLinks.removeAt(i);
                            _notifyChange();
                          });
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),

        TextButton.icon(
          onPressed: () {
            setState(() {
              _socialLinks.add(SocialLink(platform: 'Facebook'));
              _notifyChange();
            });
          },
          icon: const Icon(Icons.add, color: Colors.blue),
          label: const Text(
            'Add New Social Link',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
