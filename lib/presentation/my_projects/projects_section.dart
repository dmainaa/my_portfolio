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
  final List<PFProject> allProjects = [
    PFProject(
      title: 'Project 1',
      description: 'Description of Project 1',
      imageUrl: 'https://via.placeholder.com/150',
      teckStack: ['Flutter', 'AI'],
      projectUrl: '',
      mainStack: 'Flutter',
      techTags: [   
        TechTag(name: 'Flutter', icon: Icons.flutter_dash, link: 'https://flutter.dev'),
        TechTag(name: 'AI', icon: Icons.memory, link: 'https://ai.google/'),
      ],
    ),
    PFProject(
      title: 'Project 2',
      description: 'Description of Project 2',
      imageUrl: 'https://via.placeholder.com/150',
      teckStack: ['Android'],
      projectUrl: '',
      mainStack: 'Android',
      techTags: [   
        TechTag(name: 'Android', icon: Icons.android, link: 'https://developer.android.com/'),
      ],
    ),
  ];

  final List<PFProject> flutterProjects = [
    PFProject(
      title: 'Project 1',
      description: 'Description of Project 1',
      imageUrl: 'https://via.placeholder.com/150',
      teckStack: ['Flutter', 'AI'],
      projectUrl: '',
      mainStack: 'Flutter',
      techTags: [   
        TechTag(name: 'Flutter', icon: Icons.flutter_dash, link: 'https://flutter.dev'),
        TechTag(name: 'AI', icon: Icons.memory, link: 'https://ai.google/'),
      ],
    ),
  ];

  final Map<String, List<PFProject>> projects = {
    'All': [
      PFProject(
        title: 'Project 1',
        description: 'Description of Project 1',
        imageUrl: 'assets/images/sample_cover1.png',
        teckStack: ['Flutter', 'AI'],
        projectUrl: '',
        mainStack: 'Flutter',
        techTags: [   
          TechTag(name: 'Flutter', icon: Icons.flutter_dash, link: 'https://flutter.dev'),
          TechTag(name: 'AI', icon: Icons.memory, link: 'https://ai.google/'),
        ],
      ),
      PFProject(
        title: 'Project 2',
        description: 'Description of Project 2',
        imageUrl: 'assets/images/sample_cover2.png',
        teckStack: ['Android'],
        projectUrl: '',
        mainStack: 'Android',
        techTags: [   
          TechTag(name: 'Android', icon: Icons.android, link: 'https://developer.android.com/'),
        ],
      ),
      PFProject(
        title: 'Project 3',
        description: 'Description of Project 2',
        imageUrl: 'assets/images/sample_cover3.png',
        teckStack: ['Android'],
        projectUrl: '',
        mainStack: 'Android',
        techTags: [   
          TechTag(name: 'Android', icon: Icons.android, link: 'https://developer.android.com/'),
        ],
      ),


      
    ],
    'Flutter': [
      PFProject(
        title: 'Project 1',
        description: 'Description of Project 1',
        imageUrl: 'https://via.placeholder.com/150',
        teckStack: ['Flutter', 'AI'],
        projectUrl: '',
        mainStack: 'Flutter',
        techTags: [   
          TechTag(name: 'Flutter', icon: Icons.flutter_dash, link: 'https://flutter.dev'),
          TechTag(name: 'AI', icon: Icons.memory, link: 'https://ai.google/'),
        ],
      ),
    ],
    'Android': [
      PFProject(
        title: 'Project 2',
        description: 'Description of Project 2',
        imageUrl: 'https://via.placeholder.com/150',
        teckStack: ['Android'],
        projectUrl: '',
        mainStack: 'Android',
        techTags: [   
          TechTag(name: 'Android', icon: Icons.android, link: 'https://developer.android.com/'),
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
            PFTabLayout(
              items: [
                PFTabItem(LocaleKeys.all.tr()),
                PFTabItem(LocaleKeys.flutter.tr()),
                PFTabItem(LocaleKeys.android.tr()),
                PFTabItem(LocaleKeys.ai.tr()),
              ],
              onTabSelected: (index) {
                // Handle tab selection
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            const PFSpacer(size: PFAppSize.s20),
            PFProjectsView(children: projects[getSelectedTabTitle(selectedIndex)]?.map((project) {
              return LayoutBuilder(
                builder: (context, constraints) =>
                 PFProjectCard(
                  project: project,
                  constraints: constraints,
                ),
              );
            }).toList() ?? []),
            // You can add your project cards or list here
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
      return LocaleKeys.all.tr(); // Default to All if not found
  }
}

