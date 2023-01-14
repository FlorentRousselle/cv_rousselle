import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/cards/experience_card.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceDataWidget extends StatelessWidget {
  final HomeNotifier homeNotifier;
  final bool isWeb;

  const ExperienceDataWidget({
    Key? key,
    required this.homeNotifier,
    this.isWeb = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        children: [
          if (isWeb)
            Align(
              child: WebTitleWidget(
                visibilityKey: homeNotifier.getInfo(1).key,
                onVisibilityChanged: (info) => homeNotifier.visibilityChanged(info, 1),
                title: "Expériences",
                iconLink: Global.experienceSvg,
                width: 240,
              ),
              alignment: Alignment.centerLeft,
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              spacing: 30.0,
              runSpacing: 30.0,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                for (var item in homeNotifier.listExperience!)
                  VisibilityDetector(
                    key: Key("${homeNotifier.getInfo(1).key.toString()}${item.details}${item.title}${item.period}"),
                    onVisibilityChanged: (info) => homeNotifier.visibilityChanged(info, 1),
                    child: ExperienceCardWidget(
                      dataExperience: item,
                      isWeb: isWeb,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
