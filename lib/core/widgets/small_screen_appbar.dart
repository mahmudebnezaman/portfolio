import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_texts.dart';

class CustomSmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSmallAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: AppBar(
          backgroundColor: Colors.black.withValues(alpha: 0.55),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
              ),
            ),
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
