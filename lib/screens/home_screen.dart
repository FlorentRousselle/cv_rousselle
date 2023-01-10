import 'package:cv_flutter/models/selector_item_model.dart';
import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/notifiers/theme_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/widgets/app_bar_widget.dart';
import 'package:cv_flutter/widgets/selector_menu_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';
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
      return const Text("loading");
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

  Widget webHomeScreenBuilder(HomeNotifier homeNotifier, bool isSmall) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: isSmall ? 80 : 250,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("title"),
                Center(
                  child: Column(
                    children: [
                      SelectorMenuItem(
                        item: SelectorItemModel(
                            name: "Profil", iconLink: Global.profilSvg),
                        onPressed: () => homeNotifier.webGoToIndex(0),
                        isSelected: homeNotifier.currentIndex == 0,
                        isTextShow: !isSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectorMenuItem(
                        item: SelectorItemModel(
                            name: "Experiences",
                            iconLink: Global.experienceSvg),
                        onPressed: () => homeNotifier.webGoToIndex(1),
                        isSelected: homeNotifier.currentIndex == 1,
                        isTextShow: !isSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectorMenuItem(
                        item: SelectorItemModel(
                            name: "Formations", iconLink: Global.formationSvg),
                        onPressed: () => homeNotifier.webGoToIndex(2),
                        isSelected: homeNotifier.currentIndex == 2,
                        isTextShow: !isSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectorMenuItem(
                        item: SelectorItemModel(
                            name: "Compétences", iconLink: Global.skillSvg),
                        onPressed: () => homeNotifier.webGoToIndex(3),
                        isSelected: homeNotifier.currentIndex == 3,
                        isTextShow: !isSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectorMenuItem(
                        item: SelectorItemModel(
                            name: "Mes projets", iconLink: Global.projectSvg),
                        onPressed: () => homeNotifier.webGoToIndex(4),
                        isSelected: homeNotifier.currentIndex == 4,
                        isTextShow: !isSmall,
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 12.0,
                  direction: Axis.vertical,
                  children: [
                    SelectorMenuItem(
                      item: SelectorItemModel(
                          name: "Changer de thème", iconLink: Global.swapSvg),
                      onPressed: () {
                        var themeNotifier = ref.read(themeProvider);
                        themeNotifier.swapTheme();
                      },
                      isTextShow: !isSmall,
                    ),
                    SelectorMenuItem(
                      item: SelectorItemModel(
                          name: "Facebook", iconLink: Global.facebookSvg),
                      onPressed: () {
                        launchUrl(
                          Uri.parse(Global.facebookLink),
                        );
                        Navigator.of(context).pop();
                      },
                      isTextShow: !isSmall,
                    ),
                    SelectorMenuItem(
                      item: SelectorItemModel(
                          name: "LinkedIn", iconLink: Global.linkedInSvg),
                      onPressed: () {
                        launchUrl(
                          Uri.parse(Global.linkedInLink),
                        );
                        Navigator.of(context).pop();
                      },
                      isTextShow: !isSmall,
                    ),
                    kIsWeb
                        ? SelectorMenuItem(
                      item: SelectorItemModel(
                          name: "Android App", iconLink: Global.androidSvg),
                      onPressed: () {
                        launchUrl(
                          Uri.parse(Global.androidLink),
                        );
                        Navigator.of(context).pop();
                      },
                      isTextShow: !isSmall,
                    )
                        : SelectorMenuItem(
                      item: SelectorItemModel(
                          name: "Site web", iconLink: Global.webSvg),
                      onPressed: () {
                        launchUrl(
                          Uri.parse(Global.webLink),
                        );
                        Navigator.of(context).pop();
                      },
                      isTextShow: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ScrollablePositionedList.separated(
              itemScrollController: homeNotifier.scrollController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return VisibilityDetector(
                  key: Key(index.toString()),
                  onVisibilityChanged: (VisibilityInfo info) =>
                      homeNotifier.visibilityChanged(info, index),
                  child: homeNotifier.getScreen(index, homeNotifier),
                );
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
        title: homeNotifier.getTitle(homeNotifier.currentIndex),
        themeNotifier: themeNotifier,
      ),
      body: homeNotifier.getScreen(homeNotifier.currentIndex, homeNotifier),
      bottomNavigationBar: mobileNavigationBar(homeNotifier),
    );
  }

  Widget mobileNavigationBar(HomeNotifier homeNotifier) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: BottomNavigationBar(
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
      ),
    );
  }
}
