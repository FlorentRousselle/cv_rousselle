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
                            (SkillModel skill) => skill.category == category,
                          )
                          .toList();
                  listSkillForCategory.sort(
                    (a, b) => b.rating.compareTo(a.rating),
                  );
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
                      LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
                          // calculate auto width for skill card widget
                          double maxWidth = constraints.maxWidth;
                          double minItemWidth = 235.0;
                          double spacing = 12.0;

                          int itemsPerRow = (maxWidth / minItemWidth).floor();
                          if (itemsPerRow < 1) itemsPerRow = 1;

                          double itemWidth =
                              (maxWidth / itemsPerRow) - (5 + itemsPerRow);

                          if (itemWidth > maxWidth) {
                            itemWidth = maxWidth;
                          }
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              spacing: spacing,
                              runSpacing: spacing,
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.start,
                              children: [
                                for (var skill in listSkillForCategory)
                                  SizedBox(
                                    width: itemWidth,
                                    child: SkillCardWidget(skill: skill),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
