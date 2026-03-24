import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/resources/image_resources.dart';
import 'package:cv_flutter/widgets/menus/menu_item_widget.dart';
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
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Column(
          spacing: 12.0,
          children: [
            Image.asset(ImageResources.picture, width: 160, height: 160),
            Text(
              "Florent Rousselle",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            MenuItemWidget(
              text: "Profil",
              iconPath: IconResources.profile,
              isSelected: true,
              onPressed: () {},
            ),
            MenuItemWidget(
              text: "Expériences",
              iconPath: IconResources.experience,
              isSelected: false,
              onPressed: () {},
            ),
            MenuItemWidget(
              text: "Mes projets",
              iconPath: IconResources.project,
              isSelected: false,
              onPressed: () {},
            ),
            MenuItemWidget(
              text: "Compétences",
              iconPath: IconResources.skill,
              isSelected: false,
              onPressed: () {},
            ),
            MenuItemWidget(
              text: "Formations",
              iconPath: IconResources.formation,
              isSelected: false,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
