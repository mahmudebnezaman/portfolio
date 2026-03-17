import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_texts.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/core/widgets/build_nav_buttons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onNavButtonPressed;

  const CustomAppBar({super.key, required this.onNavButtonPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      buildNavButton(context, "Home", () => onNavButtonPressed("Home")),
                      buildNavButton(context, "Skills", () => onNavButtonPressed("Skills")),
                      buildNavButton(context, "Experience", () => onNavButtonPressed("Experience")),
                      buildNavButton(context, "Projects", () => onNavButtonPressed("Projects")),
                      buildNavButton(context, "Education", () => onNavButtonPressed("Education")),
                      buildNavButton(context, "Contact", () => onNavButtonPressed("Contact")),
                      if (constraints.maxWidth > 640)
                        ElevatedButton(
                          onPressed: () => launchUrlExternal(downloadCVLink),
                          child: const Text("Download CV"),
                        ),
                    ],
                  ),
                  if (constraints.maxWidth > 750)
                    Row(
                      children: [
                        InkWell(
                          onTap: () => launchUrlExternal(linkedInLink),
                          child: SvgPicture.asset(linkedInIcon, height: 20),
                        ),
                        const Gap(5),
                        InkWell(
                          onTap: () => launchUrlExternal(githubLink),
                          child: SvgPicture.asset(githubIcon, height: 20),
                        ),
                        const Gap(5),
                        InkWell(
                          onTap: () => launchUrlExternal(teamsLink),
                          child: SvgPicture.asset(teamsIcon, height: 20),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
