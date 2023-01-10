import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/color_resources.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilMenu extends StatelessWidget {
  final HomeNotifier homeNotifier;
  final bool isWeb;

  const ProfilMenu({
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
                title: "Profil",
                iconLink: Global.profilSvg,
                width: 160,
              ),
              alignment: Alignment.centerLeft,
            ),
          for (var item in homeNotifier.listProfil!)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Center(
                child: Text(item.content),
              ),
            ),
        ],
      ),
    );
  }

  Future<bool> launcher(AirtableDataProfil value) {
    switch (value.type) {
      case "mail":
        return launchUrl(
          Uri(path: "mailto:${value.content}"),
        );
      case "tel":
        return launchUrl(
          Uri(path: "tel:${value.content}"),
        );
      case "gps":
        return launchUrl(
          Uri(
              path:
                  "https://www.google.com/maps/search/?api=1&query=${value.content}"),
        );
      default:
        return Future<bool>.value(false);
    }
  }
}
