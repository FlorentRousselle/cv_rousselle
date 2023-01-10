import 'package:cv_flutter/models/selector_item_model.dart';
import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/notifiers/theme_notifier.dart';
import 'package:cv_flutter/resources/color_resources.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/selector_menu_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftMenuWidget extends StatelessWidget {
  const LeftMenuWidget({
    Key? key,
    required this.context,
    required this.themeNotifier,
    required this.homeNotifier,
    required this.isSmall,
  }) : super(key: key);

  final BuildContext context;
  final ThemeNotifier themeNotifier;
  final HomeNotifier homeNotifier;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxHeight > 650) {
        return Container(
          width: isSmall ? 90 : 250,
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: buildContents(false),
        );
      } else {
        return SingleChildScrollView(
          child: Container(
            width: isSmall ? 90 : 250,
            height: 650,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: buildContents(true),
          ),
        );
      }
    });
  }

  Widget buildContents(bool isHeightSmall) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isSmall
            ? Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Florent Rousselle",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Theme.of(context).backgroundColor),
                  ),
                  const SizedBox(
                    width: 20,
                    height: 5,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorResources.white,
                    child: ClipOval(
                      child: Image.asset(
                        Global.profilImage,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              )
            : Wrap(
                direction: isHeightSmall ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Florent Rousselle",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Theme.of(context).backgroundColor),
                  ),
                  const SizedBox(
                    width: 20,
                    height: 5,
                  ),
                  CircleAvatar(
                    radius: isHeightSmall
                        ? 25
                        : MediaQuery.of(context).size.height / 16,
                    backgroundColor: ColorResources.white,
                    child: ClipOval(
                      child: Image.asset(
                        Global.profilImage,
                        height: isHeightSmall
                            ? 50
                            : MediaQuery.of(context).size.height / 8,
                        width: isHeightSmall
                            ? 50
                            : MediaQuery.of(context).size.height / 8,
                      ),
                    ),
                  ),
                ],
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        Center(
          child: Column(
            children: [
              SelectorMenuItem(
                item: SelectorItemModel(
                    name: "Profil", iconLink: Global.profilSvg),
                onPressed: () => homeNotifier.webGoToIndex(0),
                isSelected: homeNotifier.currentIndex == 0,
                isTextShow: !isSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              SelectorMenuItem(
                item: SelectorItemModel(
                    name: "Experiences", iconLink: Global.experienceSvg),
                onPressed: () => homeNotifier.webGoToIndex(1),
                isSelected: homeNotifier.currentIndex == 1,
                isTextShow: !isSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              SelectorMenuItem(
                item: SelectorItemModel(
                    name: "Formations", iconLink: Global.formationSvg),
                onPressed: () => homeNotifier.webGoToIndex(2),
                isSelected: homeNotifier.currentIndex == 2,
                isTextShow: !isSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              SelectorMenuItem(
                item: SelectorItemModel(
                    name: "Compétences", iconLink: Global.skillSvg),
                onPressed: () => homeNotifier.webGoToIndex(3),
                isSelected: homeNotifier.currentIndex == 3,
                isTextShow: !isSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              SelectorMenuItem(
                item: SelectorItemModel(
                    name: "Mes projets", iconLink: Global.projectSvg),
                onPressed: () => homeNotifier.webGoToIndex(4),
                isSelected: homeNotifier.currentIndex == 4,
                isTextShow: !isSmall,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(
            color: Theme.of(context).backgroundColor,
          ),
        ),
        Wrap(
          spacing: 12.0,
          direction: Axis.vertical,
          children: [
            SelectorMenuItem(
              item: SelectorItemModel(
                  name: "Changer de thème", iconLink: Global.swapSvg),
              onPressed: () {
                themeNotifier.swapTheme();
              },
              isTextShow: !isSmall,
            ),
            SelectorMenuItem(
              item: SelectorItemModel(
                  name: "Facebook", iconLink: Global.facebookSvg),
              onPressed: () {
                launchUrl(
                  Uri.parse(Global.facebookLink),
                );
                Navigator.of(context).pop();
              },
              isTextShow: !isSmall,
            ),
            SelectorMenuItem(
              item: SelectorItemModel(
                  name: "LinkedIn", iconLink: Global.linkedInSvg),
              onPressed: () {
                launchUrl(
                  Uri.parse(Global.linkedInLink),
                );
                Navigator.of(context).pop();
              },
              isTextShow: !isSmall,
            ),
            kIsWeb
                ? SelectorMenuItem(
                    item: SelectorItemModel(
                        name: "Android App", iconLink: Global.androidSvg),
                    onPressed: () {
                      launchUrl(
                        Uri.parse(Global.androidLink),
                      );
                      Navigator.of(context).pop();
                    },
                    isTextShow: !isSmall,
                  )
                : SelectorMenuItem(
                    item: SelectorItemModel(
                        name: "Site web", iconLink: Global.webSvg),
                    onPressed: () {
                      launchUrl(
                        Uri.parse(Global.webLink),
                      );
                      Navigator.of(context).pop();
                    },
                    isTextShow: true,
                  ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}
