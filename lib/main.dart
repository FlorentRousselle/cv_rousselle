import 'package:cv_flutter/app_theme_resources.dart';
import 'package:cv_flutter/global.dart';
import 'package:cv_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'CV Rousselle',
      theme: AppThemeResources.getTheme(colorTheme: lightColorTheme),
      home: const HomeScreen(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.noScaling),
          child: child ?? Container(),
        );
      },
    );
  }
}
