import 'package:cv_flutter/models/selector_item_model.dart';
import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/menus/selector_menu_item.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final HomeNotifier homeNotifier;

  const BottomBarWidget({
    Key? key,
    required this.homeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: homeNotifier.currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: SelectorMenuItem(
            item:
            SelectorItemModel(name: "Profil", iconLink: Global.profilSvg),
            onPressed: () => homeNotifier.mobileGoToIndex(0),
            isSelected: homeNotifier.currentIndex == 0,
            isTextShow: false,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SelectorMenuItem(
            item: SelectorItemModel(
                name: "Experiences", iconLink: Global.experienceSvg),
            onPressed: () => homeNotifier.mobileGoToIndex(1),
            isSelected: homeNotifier.currentIndex == 1,
            isTextShow: false,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SelectorMenuItem(
            item: SelectorItemModel(
                name: "Formations", iconLink: Global.formationSvg),
            onPressed: () => homeNotifier.mobileGoToIndex(2),
            isSelected: homeNotifier.currentIndex == 2,
            isTextShow: false,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SelectorMenuItem(
            item: SelectorItemModel(
                name: "Compétences", iconLink: Global.skillSvg),
            onPressed: () => homeNotifier.mobileGoToIndex(3),
            isSelected: homeNotifier.currentIndex == 3,
            isTextShow: false,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SelectorMenuItem(
            item: SelectorItemModel(
                name: "Mes projets", iconLink: Global.projectSvg),
            onPressed: () => homeNotifier.mobileGoToIndex(4),
            isSelected: homeNotifier.currentIndex == 4,
            isTextShow: false,
          ),
          label: "",
        ),
      ],
    );
  }
}