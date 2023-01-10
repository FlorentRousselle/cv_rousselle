import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';

class ExperienceMenu extends StatelessWidget {
  final HomeNotifier homeNotifier;

  const ExperienceMenu({
    Key? key,
    required this.homeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        children: [
          const Text("EXPERIENCE"),
          for (var item in homeNotifier.listExperience!)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Center(
                child: Text(item.title),
              ),
            ),
        ],
      ),
    );
  }

}
