import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/screens/education_screen.dart';
import 'package:cv_flutter/screens/experience_screen.dart';
import 'package:cv_flutter/screens/info_screen.dart';
import 'package:cv_flutter/screens/profil_screen.dart';
import 'package:cv_flutter/screens/skill_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    /*
    return Scaffold(
      body: _pageList[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: 'Expérience',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Formation',
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.increase_indent), label: 'Compétences'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.info), label: 'Info')
        ],
      ),
    );*/
  }

  Widget webHomeScreenBuilder(HomeNotifier homeNotifier, bool isSmall) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          isSmall
              ? Container(
                  width: 80,
                  color: Colors.blue,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("title"),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              color: homeNotifier.currentIndex == 1
                                  ? Colors.yellow
                                  : Colors.red,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: homeNotifier.currentIndex == 2
                                  ? Colors.yellow
                                  : Colors.red,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: homeNotifier.currentIndex == 3
                                  ? Colors.yellow
                                  : Colors.red,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: homeNotifier.currentIndex == 4
                                  ? Colors.yellow
                                  : Colors.red,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: homeNotifier.currentIndex == 5
                                  ? Colors.yellow
                                  : Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Text("bottom"),
                    ],
                  ),
                )
              : Container(
                  width: 250,
                  color: Colors.blue,
                ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: ListView(
                children: [
                  // 1
                  VisibilityDetector(
                    key: const Key("1"),
                    onVisibilityChanged: (VisibilityInfo info) =>
                        homeNotifier.visibilityChanged(info, 1),
                    child: Container(
                      color: Colors.red,
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
                  ),
                  // 2
                  VisibilityDetector(
                    key: const Key("2"),
                    onVisibilityChanged: (VisibilityInfo info) =>
                        homeNotifier.visibilityChanged(info, 2),
                    child: Container(
                      color: Colors.orange,
                      height: 600,
                      child: Column(
                        children: [
                          Text("Experience"),
                          for (var item in homeNotifier.listExperience!)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Center(
                                child: Text(item.title),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // 3
                  VisibilityDetector(
                    key: const Key("3"),
                    onVisibilityChanged: (VisibilityInfo info) =>
                        homeNotifier.visibilityChanged(info, 3),
                    child: Container(
                      height: 600,
                      color: Colors.yellow,
                      child: Column(
                        children: [
                          Text("Formations"),
                          for (var item in homeNotifier.listEducation!)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Center(
                                child: Text(item.title),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // 4
                  VisibilityDetector(
                    key: const Key("4"),
                    onVisibilityChanged: (VisibilityInfo info) =>
                        homeNotifier.visibilityChanged(info, 4),
                    child: Container(
                      height: 600,
                      color: Colors.green,
                      child: Column(
                        children: [
                          Text("Compétences"),
                          for (var item in homeNotifier.listSkill!)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Center(
                                child: Image.network(
                                  item.listImageLink[0],
                                  height: 100,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // 5
                  VisibilityDetector(
                    key: const Key("5"),
                    onVisibilityChanged: (VisibilityInfo info) =>
                        homeNotifier.visibilityChanged(info, 5),
                    child: Container(
                      height: 600,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Text("Mes projets"),
                          for (var item in homeNotifier.listInfo!)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Center(
                                child: Text(item.title),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileHomeScreenBuilder(HomeNotifier homeNotifier) {
    return Scaffold(
      body: Center(
        child: Text("Mobile"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
