import 'package:cv_flutter/Global.dart';
import 'package:cv_flutter/model/AirTableDataProfil.dart';
import 'package:cv_flutter/service/AirTableHttp.dart';
import 'package:cv_flutter/service/MyAirTable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 225,
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Center(
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80,
                  backgroundImage: AssetImage(PROFIL_IMAGE),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        child: SvgPicture.asset(FACEBOOK_SVG,
                            height: 25, width: 25, color: Theme.of(context).iconTheme.color),
                        onTap: () => launch(
                            "https://www.facebook.com/florent.rousselle.9")),
                    const SizedBox(width: 20),
                    GestureDetector(
                        child: SvgPicture.asset(LINKEDIN_SVG,
                            height: 25, width: 25, color: Theme.of(context).iconTheme.color),
                        onTap: () => launch(
                            "https://www.linkedin.com/in/florent-rousselle-bb843915b/")),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                        future: AIRTABLE_HTTP.getProfil(),
                        builder: (context,
                            AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
                          if (snapshot.hasData) {
                            List<AirtableDataProfil>? values = snapshot.data;
                            return SizedBox(
                                height: 300,
                                child: ListView(
                                    children: values!
                                        .map(
                                          (value) =>
                                              ListTile(
                                            leading: Text(
                                              value.icon,
                                              style: const TextStyle(
                                                  fontFamily: 'MaterialIcons'),
                                            ),
                                            title: Text(value.content),
                                                onTap: () => Launcher(value),
                                          ),
                                        )
                                        .toList()));
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }))))
      ],
    );
  }

  Future<bool> Launcher(AirtableDataProfil value) {
    switch (value.type) {
      case "mail":
        return launch("mailto:"+value.content);
      case "tel":
        return launch("tel:"+value.content);
      case "gps":
        return launch('https://www.google.com/maps/search/?api=1&query=${value.content}');
      default:
        return Future<bool>.value(false);
    }

  }
}
