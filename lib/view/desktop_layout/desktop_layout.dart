import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_texts.dart';
import 'package:portfolio/core/widgets/animated_role_text.dart';
import 'package:portfolio/core/widgets/category_label.dart';
import 'package:portfolio/core/widgets/contact_form.dart';
import 'package:portfolio/core/widgets/contact_info_panel.dart';
import 'package:portfolio/core/widgets/education_card.dart';
import 'package:portfolio/core/widgets/experience_card.dart';
import 'package:portfolio/core/widgets/fade_slide_in.dart';
import 'package:portfolio/core/widgets/large_screen_appbar.dart';
import 'package:portfolio/core/widgets/project_card.dart';
import 'package:portfolio/core/widgets/section_divider.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/core/widgets/skill_card.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    if (key.currentContext == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        onNavButtonPressed: (section) {
          switch (section) {
            case "Home":
              scrollToSection(_homeKey);
            case "Skills":
              scrollToSection(_skillsKey);
            case "Experience":
              scrollToSection(_experienceKey);
            case "Projects":
              scrollToSection(_projectsKey);
            case "Education":
              scrollToSection(_educationKey);
            case "Contact":
              scrollToSection(_contactKey);
          }
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(backgroundImage, fit: BoxFit.cover),
          ),
          // Dark gradient overlay for readability
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x33080810),
                    Color(0x99080810),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.only(
                top: kToolbarHeight + 16,
                bottom: 8,
                left: 16,
                right: 16,
              ),
              child: Column(
                children: <Widget>[
                  Container(key: _homeKey, child: homeSection(context)),
                  const SectionDivider(verticalPadding: 48),
                  Container(key: _skillsKey, child: skillSection(context)),
                  const SectionDivider(verticalPadding: 48),
                  Container(key: _experienceKey, child: experienceSection(context)),
                  const SectionDivider(verticalPadding: 48),
                  Container(key: _projectsKey, child: projectsSection(context)),
                  const SectionDivider(verticalPadding: 48),
                  Container(key: _educationKey, child: educationSection(context)),
                  const SectionDivider(verticalPadding: 48),
                  Container(key: _contactKey, child: getInTouchSection(context)),
                  const Gap(20),
                  Divider(color: Colors.white.withValues(alpha: 0.08)),
                  Text(
                    "Developed by -Mahmud",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Gap(8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget homeSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeSlideIn(
                  delay: const Duration(milliseconds: 0),
                  child: Text(homeGreeting, style: Theme.of(context).textTheme.titleSmall),
                ),
                const Gap(4),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 120),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.white, seedColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      homeNameIntro,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const Gap(4),
                const FadeSlideIn(
                  delay: Duration(milliseconds: 240),
                  child: AnimatedRoleText(),
                ),
                const Gap(16),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 360),
                  child: Text(
                    homeBio,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Gap(20),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 480),
                  child: ElevatedButton(
                    onPressed: () => scrollToSection(_contactKey),
                    child: const Text("Get in touch"),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: FadeSlideIn(
              delay: const Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  boxShadow: [
                    BoxShadow(
                      color: seedColor.withValues(alpha: 0.35),
                      blurRadius: 60,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: Image.asset(
                    profileImage,
                    height: 400,
                    fit: BoxFit.contain,
                    isAntiAlias: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget skillSection(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.18;
    return Column(
      children: [
        const SectionHeader(
          title: "Skills",
          description: skillsSectionDescription,
        ),
        const Gap(24),
        ...groupedSkills.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CategoryLabel(label: entry.key, lineWidth: 28),
              const Gap(10),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.center,
                children: entry.value.asMap().entries.map((e) {
                  return FadeSlideIn(
                    delay: Duration(milliseconds: e.key * 60),
                    child: SizedBox(
                      width: cardWidth.clamp(120, 220),
                      child: SkillCard(skill: e.value, iconSize: 72, titleFontSize: 13, showDescription: true),
                    ),
                  );
                }).toList(),
              ),
              const Gap(20),
            ],
          );
        }),
      ],
    );
  }

  Widget experienceSection(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Experience",
          description: experienceSectionDescription,
        ),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FadeSlideIn(
            child: ExperienceCard(
              onContactPressed: () => scrollToSection(_contactKey),
            ),
          ),
        ),
      ],
    );
  }

  Widget projectsSection(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Projects",
          description: projectsSectionDescription,
        ),
        const Gap(20),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          alignment: WrapAlignment.center,
          children: projectsList.asMap().entries.map((e) {
            return FadeSlideIn(
              delay: Duration(milliseconds: e.key * 80),
              child: SizedBox(
                width: (MediaQuery.sizeOf(context).width - 80) / 2,
                child: ProjectCard(project: e.value),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget educationSection(BuildContext context) {
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

  Widget getInTouchSection(BuildContext context) {
    final lottieSize = (MediaQuery.sizeOf(context).width * 0.18).clamp(100.0, 200.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: FadeSlideIn(
              child: ContactInfoPanel(lottieSize: lottieSize),
            ),
          ),
        ),
        const Gap(8),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: FadeSlideIn(
              delay: const Duration(milliseconds: 150),
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: ContactForm(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
