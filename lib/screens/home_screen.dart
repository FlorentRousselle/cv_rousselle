import 'package:cv_flutter/models/selector_item_model.dart';
import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/notifiers/theme_notifier.dart';
import 'package:cv_flutter/resources/global_resources.dart';
import 'package:cv_flutter/screens/education_screen.dart';
import 'package:cv_flutter/screens/experience_screen.dart';
import 'package:cv_flutter/screens/info_screen.dart';
import 'package:cv_flutter/screens/profil_screen.dart';
import 'package:cv_flutter/screens/skill_screen.dart';
import 'package:cv_flutter/widgets/selector_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  /// screen list
  final List<Widget> _index = const [
    ProfilScreen(),
    ExperienceScreen(),
    EducationScreen(),
    SkillScreen(),
    InfoScreen(),
  ];

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
                        onPressed: () => homeNotifier.navigateToIndex(0),
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
                        onPressed: () => homeNotifier.navigateToIndex(1),
                        isSelected: homeNotifier.currentIndex == 1,
                        isTextShow: !isSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectorMenuItem(
                        item: SelectorItemModel(
                            name: "Formations", iconLink: Global.formationSvg),
                        onPressed: () => homeNotifier.navigateToIndex(2),
                        isSelected: homeNotifier.currentIndex == 2,
                        isTextShow: !isSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectorMenuItem(
                        item: SelectorItemModel(
                            name: "Compétences", iconLink: Global.skillSvg),
                        onPressed: () => homeNotifier.navigateToIndex(3),
                        isSelected: homeNotifier.currentIndex == 3,
                        isTextShow: !isSmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectorMenuItem(
                        item: SelectorItemModel(
                            name: "Mes projets", iconLink: Global.projectSvg),
                        onPressed: () => homeNotifier.navigateToIndex(4),
                        isSelected: homeNotifier.currentIndex == 4,
                        isTextShow: !isSmall,
                      ),
                    ],
                  ),
                ),
                const Text("bottom"),
                SelectorMenuItem(
                  item: SelectorItemModel(
                      name: "Changer de thème", iconLink: Global.swapSvg),
                  onPressed: () {
                    var themeNotifier = ref.read(themeProvider);
                    themeNotifier.swapTheme();
                  },
                  isTextShow: !isSmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ScrollablePositionedList.separated(
                itemScrollController: homeNotifier.scrollController,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (VisibilityInfo info) =>
                        homeNotifier.visibilityChanged(info, index),
                    child: Container(
                      height: 600,
                      child: Column(
                        children: [
                          Text("PROFIL"),
                          for (var item in homeNotifier.listProfil!)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Center(
                                child: Text(item.content),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileHomeScreenBuilder(HomeNotifier homeNotifier) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Title"),
        ),
      ),
      body: const Center(
        child: Text("Mobile"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.remove), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.dangerous), label: ""),
        ],
      ),
    );
  }
}
