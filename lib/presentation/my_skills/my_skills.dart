import 'package:flutter/material.dart';

import 'package:portfolio_components/portfolio_components.dart';

class PFSkillsSection extends StatelessWidget {
  final bool isMobile;
  PFSkillsSection({super.key, required this.isMobile});

  List<String> get skillCategories => ['Mobile', 'Web', 'AI'];

  List<PFSkill> get mobileSkills => [
    PFSkill(title: 'Flutter', percentage: 0.9, isStarred: true),
    PFSkill(title: 'Dart', percentage: 0.9, isStarred: true),
    PFSkill(title: 'Java', percentage: 0.7),
    PFSkill(title: 'Kotlin', percentage: 0.6),
  ];
  List<PFSkill> get webSkills => [
    PFSkill(title: 'JavaScript', percentage: 0.7),
    PFSkill(title: 'TypeScript', percentage: 0.6),
    PFSkill(title: 'React', percentage: 0.8, isStarred: true),
    PFSkill(title: 'Angular', percentage: 0.5),
  ];
  List<PFSkill> get aiSkills => [
    PFSkill(title: 'Machine Learning', percentage: 0.7),
    PFSkill(title: 'Data Science', percentage: 0.6),
    PFSkill(title: 'Python', percentage: 0.8, isStarred: true),
    PFSkill(title: 'TensorFlow', percentage: 0.8, isStarred: true),
    ];

  List<Map<String, List<PFSkill>>>?  skillsByCategory;

  // Get all skills from all categories
  List<PFSkill> get allSkillsList => [
    ...mobileSkills,
    ...webSkills,
    ...aiSkills,
  ];

  @override
  Widget build(BuildContext context) {
    return PFSectionWidget(
      title: "My Skills",
      child: PFStarredSkillsView(skills: allSkillsList),
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
