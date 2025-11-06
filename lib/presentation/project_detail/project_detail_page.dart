import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:portfolio_components/portfolio_components.dart';

class ProjectDetailPage extends StatelessWidget {
  final PFProject project;
  final String? githubUrl;
  final String? playStoreUrl;

  const ProjectDetailPage({
    super.key,
    required this.project,
    this.githubUrl,
    this.playStoreUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageHeight = size.height / 1.2; // Half of screen height

    return Scaffold(
      backgroundColor: PFAppColors.scaffoldBackground,
      body: CustomScrollView(
        slivers: [
          // App Bar with back button
          SliverAppBar(
            backgroundColor: PFAppColors.scaffoldBackground,
            elevation: 0,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: PFAppColors.accent),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Large Project Image - Full Width
                AspectRatio(
                  aspectRatio: 2.5,
                  child: Image.asset(
                    project.imageBanner ?? project.imageUrl,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: PFAppColors.primary.withValues(alpha: 0.1),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 64,
                            color: PFAppColors.primary.withValues(alpha: 0.3),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Rest of content with padding
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: PFAppSize.s24,
                    vertical: PFAppSize.s32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          // Project Title
                          PFText(
                            project.title,
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: PFAppColors.accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const PFSpacer(size: PFAppSize.s24),

                          // Project Description
                          PFText(
                            LocaleKeys.description.tr(),
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: PFAppColors.accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const PFSpacer(size: PFAppSize.s12),

                          PFText(
                            project.description,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: PFAppColors.defaultTextColor,
                              height: 1.6,
                            ),
                          ),

                          const PFSpacer(size: PFAppSize.s32),

                          // Tech Stack Section
                          PFText(
                            'Tech Stack',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: PFAppColors.accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const PFSpacer(size: PFAppSize.s16),

                          Wrap(
                            spacing: PFAppSize.s16,
                            runSpacing: PFAppSize.s16,
                            children: (project.techTags ?? []).map((tag) {
                              return _TechTagChip(tag: tag);
                            }).toList(),
                          ),

                          const PFSpacer(size: PFAppSize.s32),

                          // Links Section
                          if ((githubUrl != null && githubUrl!.isNotEmpty) ||
                              (playStoreUrl != null && playStoreUrl!.isNotEmpty) ||
                              project.projectUrl.isNotEmpty) ...[
                            PFText(
                              'Links',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: PFAppColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const PFSpacer(size: PFAppSize.s16),

                            Wrap(
                              spacing: PFAppSize.s12,
                              runSpacing: PFAppSize.s12,
                              children: [
                                // GitHub Link
                                if (githubUrl != null && githubUrl!.isNotEmpty)
                                  _LinkButton(
                                    icon: Icons.code,
                                    label: 'GitHub',
                                    url: githubUrl!,
                                  ),

                                // PlayStore Link
                                if (playStoreUrl != null && playStoreUrl!.isNotEmpty)
                                  _LinkButton(
                                    icon: Icons.shop,
                                    label: 'Play Store',
                                    url: playStoreUrl!,
                                  ),

                                // Project URL
                                if (project.projectUrl.isNotEmpty)
                                  _LinkButton(
                                    icon: Icons.link,
                                    label: LocaleKeys.view_project.tr(),
                                    url: project.projectUrl,
                                  ),
                              ],
                            ),
                          ],

                          const PFSpacer(size: PFAppSize.s48),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TechTagChip extends StatelessWidget {
  final TechTag tag;

  const _TechTagChip({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PFAppSize.s16,
        vertical: PFAppSize.s12,
      ),
      decoration: BoxDecoration(
        color: PFAppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(PFAppSize.s8),
        border: Border.all(
          color: PFAppColors.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            tag.icon,
            size: 20,
            color: PFAppColors.primary,
          ),
          const SizedBox(width: PFAppSize.s8),
          PFText(
            tag.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: PFAppColors.defaultTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _LinkButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Show snackbar with the URL
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: PFText('Opening: $url'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PFAppSize.s20,
          vertical: PFAppSize.s12,
        ),
        decoration: BoxDecoration(
          color: PFAppColors.accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(PFAppSize.s8),
          border: Border.all(
            color: PFAppColors.accent.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: PFAppColors.accent,
              size: 20,
            ),
            const SizedBox(width: PFAppSize.s8),
            PFText(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: PFAppColors.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: PFAppSize.s4),
            Icon(
              Icons.open_in_new,
              size: 16,
              color: PFAppColors.accent,
            ),
          ],
        ),
      ),
    );
  }
}
