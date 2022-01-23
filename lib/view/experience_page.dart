import 'package:cv_flutter/Global.dart';
import 'package:cv_flutter/model/AirTableDataExperience.dart';
import 'package:cv_flutter/service/AirTableHttp.dart';
import 'package:flutter/material.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AIRTABLE_HTTP.getExperience(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataExperience>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataExperience>? values = snapshot.data;
          return ListView.builder(
            itemCount: values!.length,
            itemBuilder: (context, index) => Container(
                color: index % 2 == 0
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).colorScheme.secondary,
                child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(children: [
                      Expanded(
                          flex: 3,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minHeight: 50.0,
                              maxHeight: 130.0,
                            ),
                            child: values[index].logoImage,
                          )),
                      const SizedBox(width: 30),
                      Expanded(
                          flex: 17,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(values[index].title),
                                Text(
                                    "${values[index].function} (${values[index].period})",
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                                Text(values[index].detail,
                                    textAlign: TextAlign.justify,
                                    style:
                                        Theme.of(context).textTheme.subtitle1)
                              ]))
                    ]))),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
