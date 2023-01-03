import 'package:cv_flutter/notifiers/theme_notifier.dart';
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
    ThemeNotifier themeNotifier = ref.watch(themeProvider);
    return MaterialApp(
      title: 'CV Rousselle',
      theme: themeNotifier.getTheme(),
      home: const HomeScreen(),
    );
  }
}
