import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_texts.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/core/widgets/animated_role_text.dart';
import 'package:portfolio/core/widgets/build_nav_buttons.dart';
import 'package:portfolio/core/widgets/category_label.dart';
import 'package:portfolio/core/widgets/contact_form.dart';
import 'package:portfolio/core/widgets/contact_info_panel.dart';
import 'package:portfolio/core/widgets/education_card.dart';
import 'package:portfolio/core/widgets/experience_card.dart';
import 'package:portfolio/core/widgets/fade_slide_in.dart';
import 'package:portfolio/core/widgets/project_card.dart';
import 'package:portfolio/core/widgets/section_divider.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/core/widgets/skill_card.dart';
import 'package:portfolio/core/widgets/small_screen_appbar.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    if (key.currentContext == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void _navigateAndClose(GlobalKey key) {
    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 300), () => scrollToSection(key));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomSmallAppBar(),
      body: Stack(
        children: [
          if (Theme.of(context).brightness == Brightness.dark) ...[
            Positioned.fill(
              child: Image.asset(backgroundImage, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x33080810), Color(0x99080810)],
                  ),
                ),
              ),
            ),
          ] else
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFEEF2FF), Color(0xFFF5F3FF), Color(0xFFFFFFFF)],
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: kToolbarHeight + 16,
                bottom: 8,
                left: 16,
                right: 16,
              ),
              child: Column(
                children: <Widget>[
                  Container(key: _homeKey, child: _homeSection(context)),
                  const SectionDivider(verticalPadding: 32),
                  Container(key: _skillsKey, child: _skillSection(context)),
                  const SectionDivider(verticalPadding: 32),
                  Container(key: _experienceKey, child: _experienceSection(context)),
                  const SectionDivider(verticalPadding: 32),
                  Container(key: _projectsKey, child: _projectsSection(context)),
                  const SectionDivider(verticalPadding: 32),
                  Container(key: _educationKey, child: _educationSection(context)),
                  const SectionDivider(verticalPadding: 32),
                  Container(key: _contactKey, child: _contactSection(context)),
                  const Gap(20),
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
                  Text("Developed by -Mahmud", style: Theme.of(context).textTheme.bodySmall),
                  const Gap(8),
                ],
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.65,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildNavButton(context, "Home", () => _navigateAndClose(_homeKey)),
                      const Gap(10),
                      buildNavButton(context, "Skills", () => _navigateAndClose(_skillsKey)),
                      const Gap(10),
                      buildNavButton(context, "Experience", () => _navigateAndClose(_experienceKey)),
                      const Gap(10),
                      buildNavButton(context, "Projects", () => _navigateAndClose(_projectsKey)),
                      const Gap(10),
                      buildNavButton(context, "Education", () => _navigateAndClose(_educationKey)),
                      const Gap(10),
                      buildNavButton(context, "Contact", () => _navigateAndClose(_contactKey)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => launchUrlExternal(downloadCVLink),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: seedColor,
                          foregroundColor: primaryTextColor,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: const Text("Download CV"),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Get in touch", style: Theme.of(context).textTheme.bodySmall),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
                  Text("Developed by -Mahmud", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeSection(BuildContext context) {
    return Column(
      children: [
        FadeSlideIn(
          delay: const Duration(milliseconds: 100),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: seedColor.withValues(alpha: 0.35),
                  blurRadius: 50,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                profileImage,
                height: 180,
                fit: BoxFit.contain,
                isAntiAlias: true,
              ),
            ),
          ),
        ),
        const Gap(10),
        FadeSlideIn(
          delay: const Duration(milliseconds: 200),
          child: Text(homeGreeting, style: Theme.of(context).textTheme.bodySmall),
        ),
        const Gap(2),
        FadeSlideIn(
          delay: const Duration(milliseconds: 300),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, seedColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              homeNameIntro,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Gap(4),
        const FadeSlideIn(
          delay: Duration(milliseconds: 400),
          child: AnimatedRoleText(),
        ),
        const Gap(10),
        FadeSlideIn(
          delay: const Duration(milliseconds: 500),
          child: Text(
            homeBioShort,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
        const Gap(14),
        FadeSlideIn(
          delay: const Duration(milliseconds: 600),
          child: ElevatedButton(
            onPressed: () => scrollToSection(_contactKey),
            child: const Text("Get in touch"),
          ),
        ),
      ],
    );
  }

  Widget _skillSection(BuildContext context) {
    final cardWidth = (MediaQuery.sizeOf(context).width - 56) / 2;
    return Column(
      children: [
        const SectionHeader(
          title: "Skills",
          description: skillsSectionDescription,
        ),
        const Gap(20),
        ...groupedSkills.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CategoryLabel(label: entry.key, lineWidth: 20, letterSpacing: 1.6),
              const Gap(8),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.center,
                children: entry.value.asMap().entries.map((e) {
                  return FadeSlideIn(
                    delay: Duration(milliseconds: e.key * 50),
                    child: SizedBox(
                      width: cardWidth,
                      child: SkillCard(skill: e.value, iconSize: 52, titleFontSize: 11),
                    ),
                  );
                }).toList(),
              ),
              const Gap(16),
            ],
          );
        }),
      ],
    );
  }

  Widget _experienceSection(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Experience",
          description: experienceSectionDescription,
        ),
        const Gap(20),
        FadeSlideIn(
          child: ExperienceCard(onContactPressed: () => scrollToSection(_contactKey)),
        ),
      ],
    );
  }

  Widget _projectsSection(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Projects",
          description: projectsSectionDescription,
        ),
        const Gap(20),
        ...projectsList.asMap().entries.map(
          (e) => FadeSlideIn(
            delay: Duration(milliseconds: e.key * 80),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ProjectCard(project: e.value),
            ),
          ),
        ),
      ],
    );
  }

  Widget _educationSection(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Education",
          description: educationSectionDescription,
        ),
        const Gap(20),
        ...educationList.asMap().entries.map(
          (e) => FadeSlideIn(
            delay: Duration(milliseconds: e.key * 80),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: EducationCard(education: e.value),
            ),
          ),
        ),
      ],
    );
  }

  Widget _contactSection(BuildContext context) {
    final lottieSize = (MediaQuery.sizeOf(context).width * 0.35).clamp(100.0, 180.0);
    return FadeSlideIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactInfoPanel(
            lottieSize: lottieSize,
            titleStyle: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(20),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.08),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: ContactForm(),
            ),
          ),
        ],
      ),
    );
  }
}
