import 'package:cv_flutter/models/tables/air_table_data_education.dart';
import 'package:cv_flutter/notifiers/education_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EducationScreen extends ConsumerWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EducationNotifier educationNotifier = ref.watch(educationProvider);
    return FutureBuilder(
      future: educationNotifier.initEducationData(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataEducation>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataEducation>? values = snapshot.data;
          return ListView.builder(
            itemCount: values!.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 50.0,
                          maxHeight: 100.0,
                        ),
                        child: Image.network(values[index].imageLink),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      flex: 17,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(values[index].title),
                          Text(values[index].detail,
                              style: Theme.of(context).textTheme.subtitle1)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
