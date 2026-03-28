import 'package:cv_flutter/models/projects/project_model.dart';
import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectModel project;

  const ProjectCardWidget({Key? key, required this.project})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
                    child: Text(
                      project.title,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Image.asset(
                    project.imageLink,
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
                    project.listDetail.map((String activity) {
                      String bullet = "\u2022";
                      return Row(
                        spacing: 8.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bullet,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Flexible(
                            child: Text(
                              activity,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
              if (project.hasLink)
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      text: TextSpan(
                        text: "Voir le projet",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        recognizer:
                        project.hasLink
                            ? (TapGestureRecognizer()
                          ..onTap =
                              () => launchUrl(
                            Uri.parse(project.urlLink),
                          ))
                            : null,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
