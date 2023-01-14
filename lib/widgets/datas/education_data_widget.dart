import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/cards/education_card_widget.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class EducationData extends StatelessWidget {
  final HomeNotifier homeNotifier;
  final bool isWeb;

  const EducationData({
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
                visibilityKey: homeNotifier.getInfo(2).key,
                onVisibilityChanged: (info) =>
                    homeNotifier.visibilityChanged(info, 2),
                title: "Formations",
                iconLink: Global.formationSvg,
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
                for (var item in homeNotifier.listEducation!)
                  VisibilityDetector(
                    key: Key(
                        "${homeNotifier.getInfo(2).key.toString()}${item.details}${item.diploma}${item.date}"),
                    onVisibilityChanged: (info) =>
                        homeNotifier.visibilityChanged(info, 2),
                    child: EducationCardWidget(
                      dataEducation: item,
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
