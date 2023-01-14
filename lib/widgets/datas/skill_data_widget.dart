import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';

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
    return Container(
      height: 600,
      child: Padding(
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
            for (var item in homeNotifier.listSkill!)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Center(
                  child: Text(item.category),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
