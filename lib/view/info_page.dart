import 'package:cv_flutter/Global.dart';
import 'package:cv_flutter/ThemeData.dart';
import 'package:cv_flutter/model/AirTableDataInfo.dart';
import 'package:cv_flutter/service/ThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AIRTABLE_HTTP.getInfo(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataInfo>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataInfo>? values = snapshot.data;
          return ListView.builder(
            itemCount: values!.length,
            itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color:
                                Theme.of(context).appBarTheme.backgroundColor),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SizedBox(
                                          height: 200,
                                          child: values[index].InfoImage)),
                                  Positioned(
                                      right: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor
                                                      .withOpacity(0.75)),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text(
                                                      values[index].title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2,
                                                      textAlign:
                                                          TextAlign.start)))))
                                ],
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Text(values[index].detail,
                                      textAlign: TextAlign.justify))
                            ]))),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
