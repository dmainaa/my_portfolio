import 'package:flutter/material.dart';

import 'package:portfolio_components/portfolio_components.dart';

class PFSkillsSection extends StatelessWidget {
  final bool isMobile;
  PFSkillsSection({super.key, required this.isMobile});

  List<String> get skillCategories => ['Mobile', 'Web', 'AI'];

  List<PFSkill> get mobileSkills => [
    PFSkill(title: 'Flutter', percentage: 0.8),
    PFSkill(title: 'Dart', percentage: 0.9),
    PFSkill(title: 'Java', percentage: 0.7),
    PFSkill(title: 'Kotlin', percentage: 0.6),
  ]; 
  List<PFSkill> get webSkills => [
    PFSkill(title: 'JavaScript', percentage: 0.7),
    PFSkill(title: 'TypeScript', percentage: 0.6),
    PFSkill(title: 'React', percentage: 0.8),
    PFSkill(title: 'Angular', percentage: 0.5),
  ];
  List<PFSkill> get aiSkills => [
    PFSkill(title: 'Machine Learning', percentage: 0.7),
    PFSkill(title: 'Data Science', percentage: 0.6),
    PFSkill(title: 'Python', percentage: 0.8),
    PFSkill(title: 'TensorFlow', percentage: 0.5),
    ];

  List<Map<String, List<PFSkill>>>?  skillsByCategory;

  @override
  Widget build(BuildContext context) {
    return PFSectionWidget(
      title: "My Skills",
      child: LayoutBuilder(
        builder: (context, constraints) =>
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 3,
            childAspectRatio: isMobile ? 1.5 : 1.0,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final skills = getAllSkills(isMobile, constraints);
            return skills[index];
          },
          itemCount: getAllSkills(isMobile, constraints).length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  List<Widget> getAllSkills(bool isMobile, BoxConstraints constraints) {
 skillsByCategory = [
      {'Mobile': mobileSkills},
      {'Web': webSkills},
      {'AI': aiSkills},
    ];

    return skillsByCategory!.map((categoryMap) {
      final category = categoryMap.keys.first;
      final skills = categoryMap[category] ?? [];
      return PFSkillsCard(
        skills: skills,
        constraints: constraints,
        title: category,
      );
    }).toList();
}
}



List<Widget> getMySkills({required List<PFSkill> skills}) {
  return skills
      .map((skill) => PFSkillLevel(percentage: skill.percentage))
      .toList();
}
