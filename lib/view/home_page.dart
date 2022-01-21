import 'package:cv_flutter/view/education_page.dart';
import 'package:cv_flutter/view/experience_page.dart';
import 'package:cv_flutter/view/info_page.dart';
import 'package:cv_flutter/view/profil_page.dart';
import 'package:cv_flutter/view/skill_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// écran par défaut
  int _currentPage = 0;

  /// liste des écrans
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
              icon: Icon(CupertinoIcons.increase_indent),
              label:'Compétences'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.info),
              label:'Info')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}



