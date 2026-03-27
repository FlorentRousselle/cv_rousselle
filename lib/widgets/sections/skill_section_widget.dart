import 'package:cv_flutter/models/projects/project_model.dart';
import 'package:cv_flutter/models/skills/skill_model.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/cards/project_card_widget.dart';
import 'package:cv_flutter/widgets/cards/skill_card_widget.dart';
import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
import 'package:cv_flutter/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SkillSectionWidget extends StatelessWidget {
  final List<SkillModel> listSkill;

  const SkillSectionWidget({super.key, required this.listSkill});

  @override
  Widget build(BuildContext context) {
    List<String> listCategory = [];
    for (SkillModel skill in listSkill) {
      if (!listCategory.contains(skill.category)) {
        listCategory.add(skill.category);
      }
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          spacing: 12.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SectionHeaderWidget(
              iconPath: IconResources.project,
              text: "Mes projets",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                spacing: 70.0,
                children:
                    listCategory.map((String category) {
                      List<SkillModel> listSkillForCategory =
                          listSkill
                              .where(
                                (SkillModel skill) =>
                                    skill.category == category,
                              )
                              .toList();
                      listSkillForCategory.sort((a, b) => b.rating.compareTo(a.rating));
                      return Column(
                        spacing: 12.0,
                        children: [
                          IntrinsicHeight(
                            child: CustomGlassmorphismContainerWidget(
                              child: Padding(
                                padding: const EdgeInsetsGeometry.symmetric(
                                  horizontal: 15.0,
                                  vertical: 10.0,
                                ),
                                child: Center(
                                  child: Text(
                                    category,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Wrap(
                              spacing: 12.0,
                              runSpacing: 12.0,
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              children: [
                                for (var skill in listSkillForCategory)
                                  SkillCardWidget(skill: skill),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
