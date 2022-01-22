import 'package:cv_flutter/model/AirTableDataExperience.dart';
import 'package:cv_flutter/model/AirTableDataProfil.dart';
import 'package:cv_flutter/service/AirTableHttp.dart';
import 'package:flutter/material.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final AirTableHttp airtableData = AirTableHttp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: airtableData.getExperience(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AirtableDataExperience>> snapshot) {
            if (snapshot.hasData) {
              List<AirtableDataExperience>? values = snapshot.data;
              return ListView(
                children: values!
                    .map(
                      (AirtableDataExperience value) => ListTile(
                        title: Text(value.title),
                        subtitle: Container(child: value.logo, height: 100,width: 100),
                      ),
                    )
                    .toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
  }
}
