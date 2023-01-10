import 'package:cv_flutter/models/selector_item_model.dart';
import 'package:cv_flutter/notifiers/theme_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/selector_menu_item.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// Menu to add in AppBar
/// show a Menu with clickable item
///
class PopupMenuButtonWidget extends StatelessWidget {
  final ThemeNotifier themeNotifier;

  const PopupMenuButtonWidget({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.menu),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      position: PopupMenuPosition.under,
      color: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 10.0,
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          child: Center(
            child: SelectorMenuItem(
              item: SelectorItemModel(
                  name: "Changer de thème", iconLink: Global.swapSvg),
              onPressed: () {
                Navigator.of(context).pop();
                themeNotifier.swapTheme();
              },
              isTextShow: true,
            ),
          ),
        ),
        PopupMenuItem<int>(
          child: Center(
            child: SelectorMenuItem(
              item: SelectorItemModel(
                  name: "Facebook", iconLink: Global.facebookSvg),
              onPressed: () {
                launchUrl(
                  Uri.parse(Global.facebookLink),
                );
                Navigator.of(context).pop();
              },
              isTextShow: true,
            ),
          ),
        ),
        PopupMenuItem<int>(
          child: Center(
            child: SelectorMenuItem(
              item: SelectorItemModel(
                  name: "LinkedIn", iconLink: Global.linkedInSvg),
              onPressed: () {
                launchUrl(
                  Uri.parse(Global.linkedInLink),
                );
                Navigator.of(context).pop();
              },
              isTextShow: true,
            ),
          ),
        ),
        kIsWeb
            ? PopupMenuItem<int>(
                child: Center(
                  child: SelectorMenuItem(
                    item: SelectorItemModel(
                        name: "Android App", iconLink: Global.androidSvg),
                    onPressed: () {
                      launchUrl(
                        Uri.parse(Global.androidLink),
                      );
                      Navigator.of(context).pop();
                    },
                    isTextShow: true,
                  ),
                ),
              )
            : PopupMenuItem<int>(
                child: Center(
                  child: SelectorMenuItem(
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
                ),
              ),
      ],
    );
  }
}
