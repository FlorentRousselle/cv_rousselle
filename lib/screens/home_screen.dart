import 'package:cv_flutter/notifiers/home_notifier.dart';
import 'package:cv_flutter/screens/education_screen.dart';
import 'package:cv_flutter/screens/experience_screen.dart';
import 'package:cv_flutter/screens/info_screen.dart';
import 'package:cv_flutter/screens/profil_screen.dart';
import 'package:cv_flutter/screens/skill_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  /// default screen
  int _currentPage = 0;
  String title = "Florent Rousselle";
  bool iconVisibility = false;

  /// screen list
  final List<Widget> _pageList = const [
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
        if (constraints.maxWidth > 750) {
          return WebHomeScreenBuilder();
        } else {
          return MobileHomeScreenBuilder();
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

  Widget WebHomeScreenBuilder() {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 250,
            color: Colors.blue,
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget MobileHomeScreenBuilder() {
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

  void onTabTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          title = "Florent Rousselle";
          iconVisibility = false;
          break;
        case 1:
          title = "Expériences";
          iconVisibility = true;
          break;
        case 2:
          title = "Formations";
          iconVisibility = true;
          break;
        case 3:
          title = "Compétences";
          iconVisibility = true;
          break;
        case 4:
          title = "Infos";
          iconVisibility = true;
          break;
      }
      _currentPage = index;
    });
  }
}