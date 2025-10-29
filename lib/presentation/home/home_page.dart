import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/presentation/about/about_me_section.dart';
import 'package:my_portifolio/presentation/get_in_touch/get_in_touch_section.dart';
import 'package:my_portifolio/presentation/intro_section/home_intro_section.dart';
import 'package:my_portifolio/presentation/my_projects/projects_section.dart';
import 'package:my_portifolio/presentation/my_skills/my_skills.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:portfolio_components/portfolio_components.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for each section
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final renderBox = context.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero).dy;
      final offset = _scrollController.offset;

      // Calculate target position accounting for AppBar height
      final targetPosition = offset + position - 100; // 100px offset for floating AppBar

      _scrollController.animateTo(
        targetPosition,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    size.width > PFAppSize.mobile ? PFAppSize.s50 : PFAppSize.s20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  size.width > PFAppSize.mobile
                      ? const PFSpacer(size: PFAppSize.s100)
                      : const SizedBox.shrink(),
                  HomeIntroSection(key: _homeKey),
                  const PFSpacer(),
                  PFAboutMeSection(
                    key: _aboutKey,
                    profileImagePath: 'assets/images/profile_image.png',
                  ),
                  const PFSpacer(),
                  PFProjectsSection(key: _projectsKey),
                  const PFSpacer(),
                  PFSkillsSection(
                    key: _skillsKey,
                    isMobile: size.width < 600,
                  ),
                  const PFSpacer(),
                  GetInTouchSection(key: _contactKey),
                  const PFSpacer(),
                ],
              ),
            ),
          ),
          // Floating AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PFHeader(
              title: LocaleKeys.portfolio.tr(),
              links: [
                PFLink(
                  title: LocaleKeys.home.tr(),
                  onTap: () => _scrollToSection(_homeKey),
                ),
                PFLink(
                  title: LocaleKeys.about.tr(),
                  onTap: () => _scrollToSection(_aboutKey),
                ),
                PFLink(
                  title: LocaleKeys.projects.tr(),
                  onTap: () => _scrollToSection(_projectsKey),
                ),
                PFLink(
                  title: LocaleKeys.skills.tr(),
                  onTap: () => _scrollToSection(_skillsKey),
                ),
                PFLink(
                  title: LocaleKeys.contact.tr(),
                  onTap: () => _scrollToSection(_contactKey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}