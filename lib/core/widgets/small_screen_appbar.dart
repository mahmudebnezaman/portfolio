import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_texts.dart';
import 'package:portfolio/core/theme_notifier.dart';

class CustomSmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSmallAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: AppBar(
          backgroundColor: isDark
              ? Colors.black.withValues(alpha: 0.55)
              : Colors.white.withValues(alpha: 0.80),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.08),
                ),
              ),
            ),
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            ValueListenableBuilder<ThemeMode>(
              valueListenable: ThemeNotifier.of(context),
              builder: (ctx, mode, _) => IconButton(
                tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
                icon: Icon(
                  isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                  size: 20,
                ),
                onPressed: () => ThemeNotifier.toggle(ctx),
              ),
            ),
            Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(ctx).openEndDrawer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
