import 'package:flutter/material.dart';
import 'package:portfolio/view/desktop_layout/desktop_layout.dart';
import 'package:portfolio/view/mobile_layout/mobile_layout.dart';
import 'package:portfolio/view/tablet_layout/tablet_layout.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key, required this.title});

  final String title;

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileLayout();
        } else if (constraints.maxWidth < 900) {
          return const TabletLayout();
        } else {
          return const DesktopLayout();
        }
      },
    );
  }
}
