import 'package:cv_flutter/models/educations/education_model.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/cards/education_card_widget.dart';
import 'package:cv_flutter/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EducationSectionWidget extends StatelessWidget {
  final List<EducationModel> listEducation;

  const EducationSectionWidget({super.key, required this.listEducation});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 900 ? 2 : 1;
        return Column(
          spacing: 12.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SectionHeaderWidget(
              iconPath: IconResources.formation,
              text: "Formations",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: StaggeredGrid.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 70,
                crossAxisSpacing: 12,
                children:
                    listEducation.map((EducationModel education) {
                      return StaggeredGridTile.fit(
                        crossAxisCellCount: 2,
                        child: EducationCardWidget(education: education),
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
