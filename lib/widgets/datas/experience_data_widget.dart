import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/cards/experience_card.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';

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
            const Align(
              child: WebTitleWidget(
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
                  ExperienceCardWidget(
                    dataExperience: item,
                    isWeb: isWeb,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
