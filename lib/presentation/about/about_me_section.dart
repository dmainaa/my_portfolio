import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:portfolio_components/portfolio_components.dart'
    show PFAppColors, PFAppSize, PFAppTypography, PFSectionWidget, PFSpacer, PFText, PFTextWithIcon;

class PFAboutMeSection extends StatelessWidget {
  final String profileImagePath;

  const PFAboutMeSection({super.key, required this.profileImagePath});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    final aboutTexts = [
      LocaleKeys.iAmAPassionateMobileDeveloper.tr(),
      LocaleKeys.iSeeMobileDevelopment.tr(),
      LocaleKeys.whenIamNotCoding.tr(),
    ];

    final contentColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PFText(
          LocaleKeys.whoAmI.tr(),
          style: PFAppTypography.semiBold.copyWith(
            color: PFAppColors.accent,
          ),
        ),
        PFSpacer(),
        for (var text in aboutTexts) ...[
          PFText(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: PFAppColors.defaultTextColor,
              fontSize: 16,
            ),
            maxLines: 7,
          ),
          const PFSpacer(),
        ],
        AboutMeSection(
          title1: LocaleKeys.basedIn.tr(),
          title2: LocaleKeys.fivePlusYearsExperience.tr(),
          icon1: LucideIcons.user2,
          icon2: LucideIcons.code,
        ),
        const PFSpacer(),
        AboutMeSection(
          title1: LocaleKeys.remoteWork.tr(),
          title2: LocaleKeys.continousLearner.tr(),
          icon1: LucideIcons.globe,
          icon2: LucideIcons.bookOpen,
        ),
        const PFSpacer(),
      ],
    );

    return PFSectionWidget(
      title: LocaleKeys.about.tr(),
      child:
          isMobile
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(profileImagePath),
                  const PFSpacer(),

                  contentColumn,
                ],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: contentColumn),
                  const PFSpacer(vertical: false, size: PFAppSize.s50),
                  Expanded(flex: 1, child: Image.asset(profileImagePath)),
                ],
              ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  final String title1;
  final String title2;
  final IconData icon1;
  final IconData icon2;

  const AboutMeSection({
    super.key,
    required this.title1,
    required this.title2,
    required this.icon1,
    required this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: PFAboutSectionIconText(title: title1, icon: icon1)),
        PFSpacer(size: PFAppSize.s50, vertical: false),
        Expanded(flex: 1, child: PFAboutSectionIconText(title: title2, icon: icon2)),
      ],
    );
  }
}

class PFAboutSectionIconText extends StatelessWidget {
  const PFAboutSectionIconText({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return PFTextWithIcon(
      title,
      icon: icon,
      iconColor: PFAppColors.primary,
      textColor: PFAppColors.defaultTextColor,
      maxLines: 1,
    );

  }
}
