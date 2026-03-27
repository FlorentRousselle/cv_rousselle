import 'package:cv_flutter/models/projects/project_model.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/cards/project_card_widget.dart';
import 'package:cv_flutter/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProjectSectionWidget extends StatelessWidget {
  final List<ProjectModel> listProject;

  const ProjectSectionWidget({super.key, required this.listProject});

  @override
  Widget build(BuildContext context) {
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
              child: StaggeredGrid.count(
                crossAxisCount: 1,
                mainAxisSpacing: 50,
                crossAxisSpacing: 12,
                children:
                    listProject.map((ProjectModel project) {
                      return StaggeredGridTile.fit(
                        crossAxisCellCount: 1,
                        child: ProjectCardWidget(project: project),
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
