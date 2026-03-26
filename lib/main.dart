import 'package:flutter/material.dart';
import 'package:portfolio/core/theme_notifier.dart';
import 'package:portfolio/core/themes/dark_theme.dart';
import 'package:portfolio/core/themes/light_theme.dart';
import 'package:portfolio/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _themeNotifier = ValueNotifier(ThemeMode.dark);

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeNotifier(
      notifier: _themeNotifier,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: _themeNotifier,
        builder: (context, themeMode, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mahmud Ebne Zaman',
            themeMode: themeMode,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            home: const AppHomePage(title: 'Mahmud Ebne Zaman'),
          );
        },
      ),
    );
  }
}
