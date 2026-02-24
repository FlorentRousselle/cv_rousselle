import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LeftMenuWidget extends StatelessWidget {
  const LeftMenuWidget({
    Key? key,
    required this.context,
    required this.homeNotifier,
  }) : super(key: key);

  final BuildContext context;
  final HomeNotifier homeNotifier;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 250,
      height: double.infinity,
      borderRadius: 20,
      blur: 2,
      alignment: Alignment.topCenter,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.35),
          Colors.white.withValues(alpha: 0.3),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.5),
          Colors.white.withValues(alpha: 0.1),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Text("1"),
            Text("2"),
            Text("3"),
            Text("4"),
            Text("5"),
          ],
        ),
      ),
    );
  }
}
