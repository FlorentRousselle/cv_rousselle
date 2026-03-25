import 'package:cv_flutter/resources/icon_resources.dart';
import 'package:cv_flutter/widgets/menus/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeNotifier();
});

class HomeNotifier with ChangeNotifier {
  final ItemScrollController itemScrollController = ItemScrollController();

  int selectedIndexItem = 0;

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  List<Widget> getMenuItems(bool smallFormat) {
    return <Widget>[
      MenuItemWidget(
        text: "Profil",
        iconPath: IconResources.profile,
        isSelected: selectedIndexItem == 0,
        isMobileFormat: smallFormat,
        onPressed: () {
          scrollToIndex(0);
        },
      ),
      MenuItemWidget(
        text: "Expériences",
        iconPath: IconResources.experience,
        isSelected: selectedIndexItem == 1,
        isMobileFormat: smallFormat,
        onPressed: () {
          scrollToIndex(1);
        },
      ),
      MenuItemWidget(
        text: "Mes projets",
        iconPath: IconResources.project,
        isSelected: selectedIndexItem == 2,
        isMobileFormat: smallFormat,
        onPressed: () {
          scrollToIndex(2);
        },
      ),
      MenuItemWidget(
        text: "Compétences",
        iconPath: IconResources.skill,
        isSelected: selectedIndexItem == 3,
        isMobileFormat: smallFormat,
        onPressed: () {
          scrollToIndex(3);
        },
      ),
      MenuItemWidget(
        text: "Formations",
        iconPath: IconResources.formation,
        isSelected: selectedIndexItem == 4,
        isMobileFormat: smallFormat,
        onPressed: () {
          scrollToIndex(4);
        },
      ),
    ];
  }

  void scrollToIndex(int index) {
    itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
    selectedIndexItem = index;
    notifyListeners();
  }

  void initListener() {
    itemPositionsListener.itemPositions.addListener(() {
      final positions = itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        final index =
            positions
                .where((ItemPosition position) => position.itemTrailingEdge > 0)
                .reduce(
                  (ItemPosition min, ItemPosition position) =>
                      position.itemLeadingEdge < min.itemLeadingEdge
                          ? position
                          : min,
                )
                .index;
        if (selectedIndexItem != index) {
          selectedIndexItem = index;
          notifyListeners();
        }
      }
    });
  }
}
