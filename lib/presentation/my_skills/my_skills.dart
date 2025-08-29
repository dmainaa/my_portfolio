import 'package:flutter/material.dart';
import 'package:my_portifolio/domain/models/skill.dart';
import 'package:portfolio_components/portfolio_components.dart';

class PFSkillsSection extends StatelessWidget {
  final bool isMobile;
  const PFSkillsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return PFSectionWidget(
      title: "My Skills",
      child: isMobile ? Column(
        children: getAllSkills(isMobile),
      ) : Row(
        children: getAllSkills(isMobile),
      ),
    );
  }
}

List<Widget> getAllSkills(bool isMobile) {
  return [
    PFSkillWidget(
            isMobile: isMobile,
            skills: getMySkills(
              skills: [Skill(name: 'Flutter', percentage: 0.7)],
            ),
            skillCategory: 'Frontend',
          ),
  ];
}

List<Widget> getMySkills({required List<Skill> skills}) {
  return skills
      .map((skill) => PFSkillLevel(percentage: skill.percentage))
      .toList();
}

class PFSkillWidget extends BaseCard {
  final List<Widget> skills;
  final String skillCategory;
  final bool isMobile;
  const PFSkillWidget({
    super.key,
    required this.isMobile,
    required this.skills,
    required this.skillCategory,
  });

  @override
  Widget get child => SizedBox(
    width: isMobile ? double.infinity : 200,
    child: Column(
      children: [
        PFText(
          skillCategory,
          style: PFAppTypography.bold.copyWith(
            color: PFAppColors.accent,
            fontSize: PFAppSize.s16,
          ),
        ),
        PFSpacer(),
        ...skills,
      ],
    ),
  );
}
