import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilCardWidget extends StatelessWidget {
  final AirtableDataProfil dataProfil;
  final bool isWeb;

  const ProfilCardWidget({
    Key? key,
    required this.dataProfil,
    required this.isWeb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launcher(dataProfil),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 3.0,
        child: SizedBox(
          width: isWeb ? 380 : 180,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.network(
                      dataProfil.icon,
                      width: isWeb ? 60 : 30,
                      color: Theme.of(context).textTheme.headline1!.color,
                    ),
                    SizedBox(
                      width: isWeb ? 20 : 10,
                    ),
                    Text(
                      dataProfil.title,
                      style: isWeb
                          ? Theme.of(context).textTheme.headline1
                          : Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: isWeb ? 45.0 : 20),
                  child: Text(
                    dataProfil.details,
                    style: isWeb
                        ? Theme.of(context).textTheme.headline3
                        : Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> launcher(AirtableDataProfil value) {
    switch (value.type) {
      case "mail":
        return launchUrl(
          Uri.parse("mailto:${value.details}"),
        );
      case "tel":
        return launchUrl(
          Uri.parse("tel:${value.details}"),
        );
      case "gps":
        return launchUrl(
          Uri.parse(
              "https://www.google.com/maps/search/?api=1&query=${value.details}"),
        );
      default:
        return Future<bool>.value(false);
    }
  }
}
