import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';
import 'package:portfolio_components/portfolio_components.dart';

class PFProjectsSection extends StatefulWidget {
  PFProjectsSection({super.key});

  @override
  State<PFProjectsSection> createState() => _PFProjectsSectionState();
}

class _PFProjectsSectionState extends State<PFProjectsSection> {
  int selectedIndex = 0;

  final Map<String, List<PFProject>> projects = {
    'All': [
      PFProject(
        title: 'KEPSHA',
        simpleDesc: 'A networking platform for school headteachers',
        description: 'KEPSHA is an innovative mobile application designed specifically for Kenya’s school headteachers, offering a dedicated platform for connection, collaboration, and professional development. Through its intuitive interface, headteachers across the country can effortlessly network with one another, exchanging ideas, solutions, and experiences related to school administration and education management. The app’s discussion forums and messaging features foster a vibrant community, enabling users to share best practices, address common challenges, and support each other in professional growth. In addition to peer-to-peer networking, KEPSHA provides instant access to the latest news and updates relevant to the education sector. Headteachers can stay informed about policy changes, educational events, government directives, and important announcements through the app’s real-time news feed. By centralizing essential resources and facilitating communication, KEPSHA empowers school leaders to stay ahead in their field, ultimately contributing to the advancement of Kenya’s education system.',
        imageUrl: 'assets/images/kepsha_placeholder.jpg',
        teckStack: ['Flutter', 'Firebase'],
        imageBanner: 'assets/images/kepsha_app_banner.png',
        mainStack: 'Flutter',
        techTags: [
          TechTag(name: 'Flutter', icon: Icons.flutter_dash, link: 'https://flutter.dev'),
          TechTag(name: 'Firebase', icon: Icons.memory, link: 'https://firebase.google.com/'),
        ],
        projectLinks: [
          ProjectLink(
            url: 'https://github.com/username/kepsha',
            type: ProjectLinkType.github,
          ),
        ],
      ),
      PFProject(
        title: 'Fitness Tracker',
        simpleDesc: 'Track your everyday fitness routine with ease',
        description: 'An app that helps users monitor their daily physical activities, set fitness goals, and track progress over time with detailed analytics and personalized workout recommendations',
        imageUrl: 'assets/images/fitness_tracker_placeholder.jpeg',
        teckStack: ['Flutter', 'Dart', 'Firebase'],
        imageBanner: 'assets/images/fitness_tracker_banner.png',
        mainStack: 'Flutter',
        techTags: [
          TechTag(name: 'Flutter', icon: Icons.flutter_dash, link: 'https://flutter.dev'),
          TechTag(name: 'Firebase', icon: Icons.memory, link: 'https://firebase.google.com/'),
        ],
        projectLinks: [
          ProjectLink(
            url: 'https://github.com/username/fitness-tracker',
            type: ProjectLinkType.github,
          ),
          ProjectLink(
            url: 'https://play.google.com/store/apps/details?id=com.example.fitness',
            type: ProjectLinkType.playStore,
          ),
        ],
      ),
      PFProject(
        title: 'Project 3',
        simpleDesc: 'An innovative Android application',
        description: 'Description of Project 3 - A comprehensive Android application with advanced features and modern UI design',
        imageUrl: 'assets/images/sample_cover3.png',
        teckStack: ['Android'],
        mainStack: 'Android',
        techTags: [
          TechTag(name: 'Android', icon: Icons.android, link: 'https://developer.android.com/'),
        ],
        projectLinks: [
          ProjectLink(
            url: 'https://github.com/username/project3',
            type: ProjectLinkType.github,
          ),
        ],
      ),
    ],
    'Flutter': [
      PFProject(
        title: 'KEPSHA',
        simpleDesc: 'A networking platform for school headteachers',
        description: 'An app that connects Kenya\'s school headteachers, allowing them to share resources, ideas, and best practices to improve education quality across the country',
        imageUrl: 'assets/images/kepsha_placeholder.jpg',
        teckStack: ['Flutter', 'Firebase'],
        imageBanner: 'assets/images/kepsha_app_banner.png',
        mainStack: 'Flutter',
        techTags: [
          TechTag(name: 'Flutter', icon: Icons.flutter_dash, link: 'https://flutter.dev'),
          TechTag(name: 'Firebase', icon: Icons.memory, link: 'https://firebase.google.com/'),
        ],
        projectLinks: [
          ProjectLink(
            url: 'https://github.com/username/kepsha',
            type: ProjectLinkType.github,
          ),
        ],
      ),
      PFProject(
        title: 'Fitness Tracker',
        simpleDesc: 'Track your everyday fitness routine with ease',
        description: 'An app that helps users monitor their daily physical activities, set fitness goals, and track progress over time with detailed analytics and personalized workout recommendations',
        imageUrl: 'assets/images/fitness_tracker_placeholder.jpeg',
        teckStack: ['Flutter', 'Dart', 'Firebase'],
        imageBanner: 'assets/images/fitness_tracker_banner.png',
        mainStack: 'Flutter',
        techTags: [
          TechTag(name: 'Flutter', icon: Icons.flutter_dash, link: 'https://flutter.dev'),
          TechTag(name: 'Firebase', icon: Icons.memory, link: 'https://firebase.google.com/'),
        ],
        projectLinks: [
          ProjectLink(
            url: 'https://github.com/username/fitness-tracker',
            type: ProjectLinkType.github,
          ),
          ProjectLink(
            url: 'https://play.google.com/store/apps/details?id=com.example.fitness',
            type: ProjectLinkType.playStore,
          ),
        ],
      ),
    ],
    'Android': [
      PFProject(
        title: 'Project 3',
        simpleDesc: 'An innovative Android application',
        description: 'Description of Project 3 - A comprehensive Android application with advanced features and modern UI design',
        imageUrl: 'assets/images/sample_cover3.png',
        teckStack: ['Android'],
        mainStack: 'Android',
        techTags: [
          TechTag(name: 'Android', icon: Icons.android, link: 'https://developer.android.com/'),
        ],
        projectLinks: [
          ProjectLink(
            url: 'https://github.com/username/project3',
            type: ProjectLinkType.github,
          ),
        ],
      ),
    ]
  };

  @override
  Widget build(BuildContext context) {
    return PFSectionWidget(
      title: LocaleKeys.myProjects.tr(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PFText(
              textAlign: TextAlign.center,
              LocaleKeys.hereAreSomeOfMyRecentProjects.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: PFAppColors.defaultTextColor,
              ),
            ),
            const PFSpacer(),
            PFProjectsView(
              children: projects[getSelectedTabTitle(selectedIndex)]
                      ?.map((project) {
                    return LayoutBuilder(
                      builder: (context, constraints) => GestureDetector(
                        onTap: () {
                          // Navigate to project detail page
                          final projectId =
                              project.title.toLowerCase().replaceAll(' ', '-');
                          Navigator.of(context).pushNamed(
                            '/project/$projectId',
                            arguments: {
                              'project': project,
                            },
                          );
                        },
                        child: PFProjectCard(
                          project: project,
                          constraints: constraints,
                        ),
                      ),
                    );
                  }).toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}

String getSelectedTabTitle(int index) {
  switch (index) {
    case 0:
      return LocaleKeys.all.tr();
    case 1:
      return LocaleKeys.flutter.tr();
    case 2:
      return LocaleKeys.android.tr();
    case 3:
      return LocaleKeys.ai.tr();
    default:
      return LocaleKeys.all.tr();
  }
}
