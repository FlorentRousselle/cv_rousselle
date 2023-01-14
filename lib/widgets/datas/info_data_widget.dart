import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/cards/info_card.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class InfoDataWidget extends StatelessWidget {
  final HomeNotifier homeNotifier;
  final bool isWeb;

  const InfoDataWidget({
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
                visibilityKey: homeNotifier.getInfo(4).key,
                onVisibilityChanged: (info) =>
                    homeNotifier.visibilityChanged(info, 4),
                title: "Mes projets",
                iconLink: Global.projectSvg,
                width: 240,
              ),
              alignment: Alignment.centerLeft,
            ),
          const SizedBox(
            height: 20.0,
          ),
          Wrap(
            spacing: 30.0,
            runSpacing: 30.0,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              for (var item in homeNotifier.listInfo!)
                VisibilityDetector(
                  key: Key(
                      "${homeNotifier.getInfo(4).key.toString()}${item.title}}"),
                  onVisibilityChanged: (info) =>
                      homeNotifier.visibilityChanged(info, 4),
                  child: InfoCardWidget(
                    dataInfo: item,
                    isWeb: isWeb,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
