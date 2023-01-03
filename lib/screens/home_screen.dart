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
  final List<Widget> _pageList = [
    ProfilPage(),
    ExperiencePage(),
    EducationPage(),
    SkillPage(),
    InfoPage()
  ];

  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title, iconVisibility, context),
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
