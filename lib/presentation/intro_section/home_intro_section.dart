import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/data/resume_data.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:my_portifolio/utils/pdf_generator.dart';
import 'package:portfolio_components/portfolio_components.dart';

class HomeIntroSection extends StatelessWidget {
  const HomeIntroSection({super.key});

  bool _isMobile(double width) => width < PFAppSize.mobile;
  bool _isTablet(double width) =>
      width > PFAppSize.mobile && width <= PFAppSize.desktop;

  Future<void> _downloadResumePDF(BuildContext context) async {
    Navigator.pop(context);
    try {
      // Show loading indicator
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Generating PDF...'),
          duration: Duration(seconds: 1),
          backgroundColor: PFAppColors.primary,
        ),
      );

      // Generate PDF
      final pdf = await PFResumeGenerator.generateResumePDF(sampleResume);

      // Download PDF (web-optimized)
      await PFResumeGenerator.downloadPDF(pdf, 'Denis_Maina_Resume.pdf');

      // Show success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('PDF ready! You can save or print it from the dialog.'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error generating PDF: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _showResumeDialog(BuildContext context) {
    PFResumeDialog.show(
      context,
      resume: sampleResume,
      onDownloadPDF: () => _downloadResumePDF(context),
    );
  }

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
      constraints: BoxConstraints(maxWidth: containerWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PFSpacer(size: PFAppSize.s20),
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
              fontSize: PFAppSize.s24,
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
                borderColor: PFAppColors.accent,
                textColor: PFAppColors.accent,
                icon: Icon(Icons.file_copy, color: PFAppColors.accent),
              ),
              PFPrimaryButton(
                label: LocaleKeys.viewResume.tr(),
                onPressed: () => _showResumeDialog(context),
                backgroundColor: PFAppColors.scaffoldBackground,
                borderColor: PFAppColors.primary,
                textColor: PFAppColors.primary,
                icon: const Icon(Icons.description, color: PFAppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IntroSectionButton extends StatelessWidget {
  const IntroSectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: PFPrimaryButton(
        label: LocaleKeys.viewMyWork.tr(),
        onPressed: () {},
        backgroundColor: PFAppColors.scaffoldBackground,
        borderColor: PFAppColors.primary,
        textColor: PFAppColors.primary,
      ),
    );
  }
}
