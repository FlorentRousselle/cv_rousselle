import 'package:cv_flutter/Widget/ImageContainer.dart';
import 'package:cv_flutter/model/AirTableDataSkill.dart';
import 'package:cv_flutter/service/AirTableHttp.dart';
import 'package:flutter/material.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({Key? key}) : super(key: key);

  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  final AirTableHttp airtableData = AirTableHttp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: airtableData.getSkill(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataSkill>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataSkill>? values = snapshot.data;
          return ListView(
            children: values!
                .map(
                  (value) => ListTile(
                    title: Text(value.category, style: Theme.of(context).textTheme.headline2),
                    subtitle: Wrap(children: [
                        for (var logo in value.skillImages)
                          ImageContainer(logo, context)
                      ]),
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
