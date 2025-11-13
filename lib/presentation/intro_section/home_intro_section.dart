import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/data/resume_data.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:my_portifolio/utils/pdf_generator.dart';
import 'package:portfolio_components/portfolio_components.dart';

class HomeIntroSection extends StatelessWidget {
  const HomeIntroSection({super.key, required this.onViewMyWork});

  final Function() onViewMyWork;

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
            content: Text(
              'PDF ready! You can save or print it from the dialog.',
            ),
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
    final isMobile = _isMobile(screenWidth);
    final isTablet = _isTablet(screenWidth);

    return isMobile
        ? _buildMobileLayout(context)
        : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: isTablet ? 3 : 2, child: _buildContent(context)),
            if (!isMobile) ...[
              const SizedBox(width: 50),
              Align(
                alignment: Alignment.centerRight,
                child: _buildSvgAsset(),
              ),
            ],
          ],
        );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContent(context),
        const PFSpacer(size: PFAppSize.s40),
        Center(child: _buildSvgAsset()),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
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
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: PFAppColors.defaultTextColor),
          maxLines: 4,
        ),
        const PFSpacer(size: PFAppSize.s20),
        Wrap(
          spacing: PFAppSize.s20,
          runSpacing: PFAppSize.s20,
          children: [
            PFPrimaryButton(
              label: LocaleKeys.viewMyWork.tr(),
              onPressed: onViewMyWork,
              backgroundColor: PFAppColors.scaffoldBackground,
              borderColor: PFAppColors.accent,
              textColor: PFAppColors.accent,
              icon: Icon(Icons.file_copy, color: PFAppColors.accent),
            ),
            PFPrimaryButton(
              label: LocaleKeys.viewResume.tr(),
              onPressed: () => _showResumeDialog(context),
              backgroundColor: PFAppColors.primary,
              borderColor: PFAppColors.primary,
              textColor: PFAppColors.defaultTextColor,
              icon: const Icon(Icons.description, color: PFAppColors.primary),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSvgAsset() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 400,
        maxWidth: 400,
      ),
      child: Image.asset(
        'assets/images/profile_image.png',
        fit: BoxFit.contain,
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
