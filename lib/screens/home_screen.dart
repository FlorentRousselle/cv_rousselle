import 'package:cv_flutter/models/selector_item_model.dart';
import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/notifiers/theme_notifier.dart';
import 'package:cv_flutter/resources/color_resources.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/menus/app_bar_widget.dart';
import 'package:cv_flutter/widgets/menus/bottom_bar_widget.dart';
import 'package:cv_flutter/widgets/menus/left_menu_widget.dart';
import 'package:cv_flutter/widgets/loader_widget.dart';
import 'package:cv_flutter/widgets/menus/selector_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  /// default screen
  String title = "Florent Rousselle";
  bool iconVisibility = false;

  @override
  void initState() {
    super.initState();
    final HomeNotifier homeNotifier = ref.read(homeProvider);
    homeNotifier.initData();
  }

  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    final HomeNotifier homeNotifier = ref.watch(homeProvider);
    if (homeNotifier.isDataLoading()) {
      return const LoaderWidget();
    } else {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 550) {
          return webHomeScreenBuilder(homeNotifier, constraints.maxWidth < 750);
        } else {
          return mobileHomeScreenBuilder(homeNotifier);
        }
      });
    }
  }

  Widget webHomeScreenBuilder(HomeNotifier homeNotifier, bool isLeftMenuSmall) {
    ThemeNotifier themeNotifier = ref.read(themeProvider);
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          LeftMenuWidget(
            context: context,
            homeNotifier: homeNotifier,
            themeNotifier: themeNotifier,
            isSmall: isLeftMenuSmall,
          ),
          Expanded(
            child: ScrollablePositionedList.separated(
              itemScrollController: homeNotifier.scrollController,
              itemCount: 5,
              itemBuilder: (context, index) {
                // key: homeNotifier.getInfo(index).key,
                // onVisibilityChanged: (VisibilityInfo info) =>
                // homeNotifier.visibilityChanged(info, index),
                return homeNotifier.getScreen(index, homeNotifier, true);
              },
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Divider(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileHomeScreenBuilder(HomeNotifier homeNotifier) {
    ThemeNotifier themeNotifier = ref.read(themeProvider);
    return Scaffold(
      appBar: AppBarWidget(
        iconLink: homeNotifier.getInfo(homeNotifier.currentIndex).icon,
        title: homeNotifier.getInfo(homeNotifier.currentIndex).title,
        themeNotifier: themeNotifier,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: homeNotifier.getScreen(
              homeNotifier.currentIndex, homeNotifier, false),
        ),
      ),
      bottomNavigationBar: mobileNavigationBar(homeNotifier),
    );
  }

  Widget mobileNavigationBar(HomeNotifier homeNotifier) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: BottomBarWidget(homeNotifier : homeNotifier),
    );
  }
}