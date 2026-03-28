import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class CustomGlassmorphismContainerWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double radius;

  const CustomGlassmorphismContainerWidget({
    Key? key,
    required this.child,
    this.width = double.infinity,
    this.height = double.infinity,
    this.radius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width,
      height: height,
      borderRadius: radius,
      blur: 3,
      alignment: Alignment.topCenter,
      border: 1,
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
      child: child,
    );
  }
}
