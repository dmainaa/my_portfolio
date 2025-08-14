import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:portfolio_components/portfolio_components.dart';


class HomeIntroSection extends StatelessWidget {
  const HomeIntroSection({super.key});

  bool _isMobile(double width) => width < 600;
  bool _isTablet(double width) => width >600;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double containerWidth;
    if (_isMobile(screenWidth)) {
      containerWidth = screenWidth;
    } else if (_isTablet(screenWidth)) {
      containerWidth = screenWidth / 1.5; 
    } else {
      containerWidth = screenWidth / 3; 
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: containerWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PFText(
            LocaleKeys.hiIam.tr(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: PFAppSize.s50,
                  color: Colors.white,
                ),
          ),
           PFGradientTitle(
            text: LocaleKeys.denisMaina.tr(),
            fontSize: PFAppSize.s50,
          ),
          const PFSpacer(),
          PFText(
            LocaleKeys.mobileApplicationDeveloper.tr(),
            style: PFAppTypography.semiBold.copyWith(
                  color: PFAppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: PFAppSize.s24
                ),
          ),
          const PFSpacer(),
          PFText(
            LocaleKeys.iBuildFunctional.tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PFAppColors.defaultTextColor,
                ),
                maxLines: 4,
          ),
          const PFSpacer(size: PFAppSize.s20),
          Wrap(
            spacing: PFAppSize.s20,
            runSpacing: PFAppSize.s20,
            children: [
              PFPrimaryButton(
                label: LocaleKeys.getInTouch.tr(),
                onPressed: () {},
                backgroundColor: PFAppColors.primary,
              ),
              PFPrimaryButton(
                label: LocaleKeys.viewMyWork.tr(),
                onPressed: () {},
                backgroundColor: PFAppColors.scaffoldBackground,
                borderColor: PFAppColors.primary,
                textColor: PFAppColors.primary,
     
              ),
              PFPrimaryButton(
                label: LocaleKeys.viewResume.tr(),
                onPressed: () {},
                backgroundColor: PFAppColors.scaffoldBackground,
                borderColor: PFAppColors.accent,
                textColor: PFAppColors.accent,
                icon: Icon(Icons.file_copy, color: PFAppColors.accent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
