import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class AnimatedRoleText extends StatefulWidget {
  const AnimatedRoleText({super.key});

  @override
  State<AnimatedRoleText> createState() => _AnimatedRoleTextState();
}

class _AnimatedRoleTextState extends State<AnimatedRoleText> {
  static const _roles = [
    'Mobile Application Developer',
    'Flutter & Dart Engineer',
    'Clean Architecture Advocate',
  ];

  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (mounted) setState(() => _index = (_index + 1) % _roles.length);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.4),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
            child: child,
          ),
        );
      },
      child: Text(
        '— ${_roles[_index]}',
        key: ValueKey(_index),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: seedColor),
      ),
    );
  }
}
