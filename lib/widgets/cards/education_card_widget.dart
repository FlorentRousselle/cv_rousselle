import 'package:cv_flutter/models/educations/education_model.dart';
import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EducationCardWidget extends StatelessWidget {
  final EducationModel education;

  const EducationCardWidget({Key? key, required this.education})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 900 ? 2 : 1;
        bool oneLine = crossAxisCount == 1;
        return IntrinsicHeight(
          child: Flex(
            direction: oneLine ? Axis.vertical : Axis.horizontal,
            spacing: 12.0,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntrinsicHeight(
                child: CustomGlassmorphismContainerWidget(
                  width: oneLine ? double.infinity : 100,
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 5.0,
                      vertical: 15.0,
                    ),
                    child: Center(
                      child: Text(
                        education.year.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
              if (!oneLine)
                CustomGlassmorphismContainerWidget(
                  height: 50,
                  width: 50,
                  radius: 100.0,
                  child: Center(
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: CustomGlassmorphismContainerWidget(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(
                      vertical: 15.0,
                      horizontal: 30.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 12.0,
                      children: [
                        Row(
                          spacing: 30.0,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                spacing: 4.0,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    education.title,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Text(
                                    education.location,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              education.schoolImage,
                              height: 50,
                              width: 80,
                              fit: BoxFit.contain,
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8.0,
                          children:
                              education.listActivity.map((String activity) {
                                String bullet = "\u2022";
                                return Row(
                                  spacing: 8.0,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bullet,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                    ),
                                    Flexible(
                                      child: Text(
                                        activity,
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
