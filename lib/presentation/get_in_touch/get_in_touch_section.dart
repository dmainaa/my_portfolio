import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:portfolio_components/portfolio_components.dart'
    show
        PFAppColors,
        PFAppSize,
        PFAppTypography,
        PFPrimaryButton,
        PFSectionWidget,
        PFSpacer,
        PFText;

class GetInTouchSection extends StatefulWidget {
  const GetInTouchSection({super.key});

  @override
  State<GetInTouchSection> createState() => _GetInTouchSectionState();
}

class _GetInTouchSectionState extends State<GetInTouchSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement actual message sending logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.messageSent.tr()),
          backgroundColor: PFAppColors.primary,
        ),
      );
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return PFSectionWidget(
      title: LocaleKeys.getInTouch.tr(),
      child: Column(
        children: [
          PFText(
            LocaleKeys.getInTouchDescription.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PFAppColors.defaultTextColor,
                  fontSize: 16,
                ),
          ),
          const PFSpacer(size: PFAppSize.s50),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildContactForm(),
                    const PFSpacer(size: PFAppSize.s50),
                    _buildContactInfo(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildContactForm(),
                    ),
                    const PFSpacer(size: PFAppSize.s100, vertical: false),
                    Expanded(
                      flex: 1,
                      child: _buildContactInfo(),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: PFAppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: PFAppColors.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PFText(
              LocaleKeys.sendMeAMessage.tr(),
              style: PFAppTypography.semiBold.copyWith(
                fontSize: 24,
                color: PFAppColors.defaultTextColor,
              ),
            ),
            const PFSpacer(),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _nameController,
                    label: LocaleKeys.name.tr(),
                    hint: LocaleKeys.yourName.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.pleaseEnterYourName.tr();
                      }
                      return null;
                    },
                  ),
                ),
                const PFSpacer(size: PFAppSize.s20, vertical: false),
                Expanded(
                  child: _buildTextField(
                    controller: _emailController,
                    label: LocaleKeys.email.tr(),
                    hint: LocaleKeys.yourEmail.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.pleaseEnterYourEmail.tr();
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return LocaleKeys.pleaseEnterValidEmail.tr();
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const PFSpacer(),
            _buildTextField(
              controller: _subjectController,
              label: LocaleKeys.subject.tr(),
              hint: LocaleKeys.subject.tr(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.pleaseEnterSubject.tr();
                }
                return null;
              },
            ),
            const PFSpacer(),
            _buildTextField(
              controller: _messageController,
              label: LocaleKeys.message.tr(),
              hint: LocaleKeys.yourMessage.tr(),
              maxLines: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.pleaseEnterMessage.tr();
                }
                return null;
              },
            ),
            const PFSpacer(),
            PFPrimaryButton(
              onPressed: _handleSendMessage,
              label: LocaleKeys.sendMessage.tr(),
              icon: const Icon(LucideIcons.send, size: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PFText(
          label,
          style: PFAppTypography.semiBold.copyWith(
            fontSize: 14,
            color: PFAppColors.defaultTextColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(
            color: PFAppColors.defaultTextColor,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: PFAppColors.defaultTextColor.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: PFAppColors.scaffoldBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: PFAppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: PFAppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: PFAppColors.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PFText(
          LocaleKeys.contactInformation.tr(),
          style: PFAppTypography.semiBold.copyWith(
            fontSize: 24,
            color: PFAppColors.defaultTextColor,
          ),
        ),
        const PFSpacer(),
        PFText(
          LocaleKeys.contactInformationDescription.tr(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: PFAppColors.defaultTextColor,
                fontSize: 16,
              ),
          maxLines: 3,
        ),
        const PFSpacer(size: PFAppSize.s40),
        _buildContactInfoItem(
          icon: LucideIcons.mail,
          title: LocaleKeys.email.tr(),
          value: 'hello@indoe.com',
        ),
        const PFSpacer(),
        _buildContactInfoItem(
          icon: LucideIcons.phone,
          title: LocaleKeys.phone.tr(),
          value: '+1 (123) 456-7890',
        ),
        const PFSpacer(),
        _buildContactInfoItem(
          icon: LucideIcons.mapPin,
          title: LocaleKeys.location.tr(),
          value: 'New York City, NY, USA',
        ),
        const PFSpacer(size: PFAppSize.s40),
        PFText(
          LocaleKeys.follow_me.tr(),
          style: PFAppTypography.semiBold.copyWith(
            fontSize: 18,
            color: PFAppColors.defaultTextColor,
          ),
        ),
        const PFSpacer(),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildContactInfoItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: PFAppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: PFAppColors.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PFText(
                title,
                style: PFAppTypography.semiBold.copyWith(
                  fontSize: 14,
                  color: PFAppColors.defaultTextColor.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 4),
              PFText(
                value,
                style: PFAppTypography.semiBold.copyWith(
                  fontSize: 16,
                  color: PFAppColors.defaultTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    final socials = [
      {'icon': LucideIcons.github, 'url': 'https://github.com'},
      {'icon': LucideIcons.linkedin, 'url': 'https://linkedin.com'},
      {'icon': LucideIcons.twitter, 'url': 'https://twitter.com'},
      {'icon': LucideIcons.globe, 'url': 'https://blog.example.com'},
    ];

    return Row(
      children: socials.map((social) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            onTap: () {
              // TODO: Implement opening URLs
              // launch(social['url'] as String);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: PFAppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: PFAppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Icon(
                social['icon'] as IconData,
                color: PFAppColors.primary,
                size: 20,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
