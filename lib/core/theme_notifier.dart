import 'package:flutter/material.dart';

class ThemeNotifier extends InheritedNotifier<ValueNotifier<ThemeMode>> {
  const ThemeNotifier({
    super.key,
    required ValueNotifier<ThemeMode> notifier,
    required super.child,
  }) : super(notifier: notifier);

  static ValueNotifier<ThemeMode> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeNotifier>()!.notifier!;
  }

  static void toggle(BuildContext context) {
    final notifier = of(context);
    notifier.value = notifier.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }
}
