import 'package:cv_flutter/model/AirTableDataProfil.dart';
import 'package:cv_flutter/service/AirTableHttp.dart';
import 'package:cv_flutter/service/MyAirTable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  List list = ["A", "B", "C", "D"];
  MyAirTable myAirTable = MyAirTable();
  AirTableHttp airTableHttp = AirTableHttp();

  @override
  Widget build(BuildContext context) {
    myAirTable.getProfil();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 250,
          color: Colors.blue,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text("Florent Rousselle"),
                const SizedBox(height: 10),
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/moi.png"),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        child: Image.asset("assets/images/twitter.png",
                            height: 25, width: 25),
                        onTap: () {}),
                    GestureDetector(
                        child: Image.asset("assets/images/facebook.png",
                            height: 25, width: 25),
                        onTap: () => launch(
                            "https://www.facebook.com/florent.rousselle.9")),
                    GestureDetector(
                        child: Image.asset("assets/images/linkedin.png",
                            height: 25, width: 25),
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
                        future: airTableHttp.getProfil(),
                        builder: (context,
                            AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
                          if (snapshot.hasData) {
                            List<AirtableDataProfil>? values = snapshot.data;
                            return SizedBox(
                                height: 300,
                                child: ListView(
                                    children: values!
                                        .map(
                                          (AirtableDataProfil value) =>
                                              ListTile(
                                            leading: Text(
                                              value.icon,
                                              style: const TextStyle(
                                                  fontFamily: 'MaterialIcons'),
                                            ),
                                            title: Text(value.content),
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
}

/*
BuildContext context,
                  AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataProfil>? values = snapshot.data;
                  return ListView(
                    children: values!
                        .map(
                          (AirtableDataProfil value) => ListTile(
                            leading: Text(
                              value.icon,
                              style:
                                  const TextStyle(fontFamily: 'MaterialIcons'),
                            ),
                            title: Text(value.content),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
 */

/*
ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                const Divider(
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                itemCount: values!.length,
                                itemBuilder: (BuildContext context,
                                    int index) =>
                                    Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text()),
                              ),
 */
