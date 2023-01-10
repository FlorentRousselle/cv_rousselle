import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';

class EducationMenu extends StatelessWidget {
  final HomeNotifier homeNotifier;

  const EducationMenu({
    Key? key,
    required this.homeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        children: [
          const Text("FORMATIONS"),
          for (var item in homeNotifier.listEducation!)
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
