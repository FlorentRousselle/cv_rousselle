import 'package:cv_flutter/models/tables/air_table_data_profil.dart';
import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/color_resources.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/cards/profil_card.dart';
import 'package:cv_flutter/widgets/web_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilDataWidget extends StatelessWidget {
  final HomeNotifier homeNotifier;
  final bool isWeb;

  const ProfilDataWidget({
    Key? key,
    required this.homeNotifier,
    this.isWeb = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: isWeb ? 30.0 : 10.0, horizontal: 20.0),
      child: Column(
        children: [
          if (isWeb)
            Column(
              children: const [
                Align(
                  child: WebTitleWidget(
                    title: "Profil",
                    iconLink: Global.profilSvg,
                    width: 160,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          if (!isWeb)
            Column(
              children: [
                Text(
                  "Florent Rousselle",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 7,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      Global.profilImage,
                      height: MediaQuery.of(context).size.width / 3.5,
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          Wrap(
            spacing: 30.0,
            runSpacing: 15.0,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              for (var item in homeNotifier.listProfil!)
                ProfilCardWidget(
                  dataProfil: item,
                  isWeb: isWeb,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
