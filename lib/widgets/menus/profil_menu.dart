import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilMenu extends StatelessWidget {
  final HomeNotifier homeNotifier;

  const ProfilMenu({
    Key? key,
    required this.homeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        children: [
          const Text("PROFIL"),
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
