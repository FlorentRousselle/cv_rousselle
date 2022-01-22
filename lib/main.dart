import 'package:cv_flutter/service/ThemeNotifier.dart';
import 'package:cv_flutter/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ThemeData.dart';

void main() {
  runApp(
    // Listen if themeNotifier change
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(darkTheme),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'CV Rousselle',
      theme: themeNotifier.getTheme(),
      home: const HomePage(),
    );
  }
}