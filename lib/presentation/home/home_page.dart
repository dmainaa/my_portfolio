import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/presentation/about/about_me_section.dart';
import 'package:my_portifolio/presentation/intro_section/home_intro_section.dart';
import 'package:my_portifolio/presentation/my_projects/projects_section.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:portfolio_components/portfolio_components.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PFHeader(title: LocaleKeys.portfolio.tr(), links: [
        PFLink(
          title: LocaleKeys.home.tr(),
          onTap: () {
            // Navigate to home
          },
        ),
        PFLink(
          title: LocaleKeys.about.tr(),
          onTap: () {
            // Navigate to home
          },
        ),
        PFLink(
          title: LocaleKeys.projects.tr(),
          onTap: () {
            // Navigate to projects
          },
        ),
        PFLink(
          title: LocaleKeys.skills.tr(),
          onTap: () {
            // Navigate to projects
          },
        ),
        PFLink(
          title: LocaleKeys.contact.tr(),
          onTap: () {
            // Navigate to contact
          },
        ),
      ]),
      body: SingleChildScrollView(
 // Use the HomeIntroSection for mobile and larger screens
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                size.width > PFAppSize.mobile ? PFAppSize.s50 : PFAppSize.s20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               size.width > PFAppSize.mobile
            ?  PFSpacer(size: PFAppSize.s100,)
            : SizedBox.shrink(),
              HomeIntroSection(),
              PFSpacer(),
              PFAboutMeSection(
                profileImagePath: 'assets/images/profile_image.png',
              ),
              PFSpacer(),
              PFProjectsSection(),
            ],
          ),
        ),
      ),
    );
  }
}