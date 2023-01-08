import 'package:cv_flutter/models/tables/air_table_data_skill.dart';
import 'package:cv_flutter/notifiers/skill_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkillScreen extends ConsumerWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SkillNotifier skillNotifier = ref.watch(skillProvider);
    return FutureBuilder(
      future: skillNotifier.initSkillData(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataSkill>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataSkill>? values = snapshot.data;
          return ListView(
            children: values!
                .map(
                  (value) => ListTile(
                    title: Text(value.category,
                        style: Theme.of(context).textTheme.headline2),
                    subtitle: Wrap(
                      children: [
                        for (var logo in value.listImageLink)
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.network(logo),
                              ),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 3),
                                      blurRadius: 3,
                                      color: Theme.of(context).shadowColor)
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
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
