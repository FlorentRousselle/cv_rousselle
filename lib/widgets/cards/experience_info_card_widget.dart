import 'package:cv_flutter/models/experiences/experience_info_model.dart';
import 'package:cv_flutter/widgets/custom_glassmorphism_container_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceInfoCardWidget extends StatelessWidget {
  final ExperienceInfoModel experienceInfo;

  const ExperienceInfoCardWidget({Key? key, required this.experienceInfo})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 130.0,
        ),
        child: CustomGlassmorphismContainerWidget(
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              vertical: 8.0,
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 12.0,
              children: [
                if (experienceInfo.hasImage)
                  Image.asset(
                    experienceInfo.imageLink,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        experienceInfo.title,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                      if (experienceInfo.hasDescription)
                        Text(
                          experienceInfo.description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      if (experienceInfo.hasLink)
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: RichText(
                              text: TextSpan(
                                text: "Voir l'application",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                                recognizer:
                                    experienceInfo.hasLink
                                        ? (TapGestureRecognizer()
                                          ..onTap =
                                              () => launchUrl(
                                                Uri.parse(experienceInfo.urlLink),
                                              ))
                                        : null,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
