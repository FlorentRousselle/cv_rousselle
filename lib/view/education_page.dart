import 'package:cv_flutter/Global.dart';
import 'package:cv_flutter/model/AirTableDataEducation.dart';
import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AIRTABLE_HTTP.getEducation(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataEducation>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataEducation>? values = snapshot.data;
          return ListView.builder(
            itemCount: values!.length,
            itemBuilder: (context, index) => Container(
                color: index % 2 == 0 ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).colorScheme.secondary,
                child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(children: [
                      Expanded(
                          flex: 3,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minHeight: 50.0,
                              maxHeight: 100.0,
                            ),
                            child: values[index].educationImage,
                          )),
                      const SizedBox(width: 30),
                      Expanded(
                          flex: 17,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(values[index].title),
                                Text(values[index].detail,
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
