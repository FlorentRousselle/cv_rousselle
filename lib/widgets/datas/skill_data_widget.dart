import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/cards/skill_card_widget.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillDataWidget extends StatelessWidget {
  final HomeNotifier homeNotifier;
  final bool isWeb;

  const SkillDataWidget({
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
                visibilityKey: homeNotifier.getInfo(3).key,
                onVisibilityChanged: (info) =>
                    homeNotifier.visibilityChanged(info, 3),
                title: "Compétences",
                iconLink: Global.skillSvg,
                width: 275,
              ),
              alignment: Alignment.centerLeft,
            ),
          const SizedBox(
            height: 20.0,
          ),
          for (var item in homeNotifier.listSkill!)
            VisibilityDetector(
              key: Key(
                  "${homeNotifier.getInfo(3).key.toString()}${item.category}"),
              onVisibilityChanged: (info) =>
                  homeNotifier.visibilityChanged(info, 3),
              child: Column(
                children: [
                  Text(
                    item.category,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    children: [
                      for (var skillItem in item.skillElements)
                        SkillCardWidget(
                          dataSkill: skillItem,
                          isWeb: isWeb,
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
