import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';

class SkillMenu extends StatelessWidget {
  final HomeNotifier homeNotifier;
  final bool isWeb;

  const SkillMenu({
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
                title: "Compétences",
                iconLink: Global.skillSvg,
                width: 275,
              ),
              alignment: Alignment.centerLeft,
            ),
          for (var item in homeNotifier.listSkill!)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Center(
                child: Text(item.category),
              ),
            ),
        ],
      ),
    );
  }
}
