import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_texts.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/core/widgets/animated_role_text.dart';
import 'package:portfolio/core/widgets/build_nav_buttons.dart';
import 'package:portfolio/core/widgets/contact_form.dart';
import 'package:portfolio/core/widgets/contact_info_row.dart';
import 'package:portfolio/core/widgets/education_card.dart';
import 'package:portfolio/core/widgets/experience_card.dart';
import 'package:portfolio/core/widgets/fade_slide_in.dart';
import 'package:portfolio/core/widgets/project_card.dart';
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
          Positioned.fill(
            child: Image.asset(backgroundImage, fit: BoxFit.cover),
          ),
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
                  _sectionDivider(),
                  Container(key: _skillsKey, child: _skillSection(context)),
                  _sectionDivider(),
                  Container(key: _experienceKey, child: _experienceSection(context)),
                  _sectionDivider(),
                  Container(key: _projectsKey, child: _projectsSection(context)),
                  _sectionDivider(),
                  Container(key: _educationKey, child: _educationSection(context)),
                  _sectionDivider(),
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

  Widget _sectionDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: Colors.white.withValues(alpha: 0.06))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: seedColor.withValues(alpha: 0.55),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(child: Container(height: 1, color: Colors.white.withValues(alpha: 0.06))),
        ],
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
          child: Text("Hey there,", style: Theme.of(context).textTheme.bodySmall),
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
              "I'm Mahmud Ebne Zaman",
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
            "Flutter & Dart developer with 1+ year of production experience building cross-platform mobile applications. Specializing in Clean Architecture, offline-first systems, and multi-role enterprise apps.",
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
          description:
              "Skilled in Flutter development with a strong focus on building responsive and dynamic mobile apps. Proficient in Clean Architecture, advanced state management, and backend integrations.",
        ),
        const Gap(20),
        ...groupedSkills.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _categoryLabel(context, entry.key),
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

  Widget _categoryLabel(BuildContext context, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 20, height: 1, color: seedColor.withValues(alpha: 0.4)),
        const Gap(8),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: seedColor.withValues(alpha: 0.9),
                letterSpacing: 1.6,
                fontWeight: FontWeight.w700,
              ),
        ),
        const Gap(8),
        Container(width: 20, height: 1, color: seedColor.withValues(alpha: 0.4)),
      ],
    );
  }

  Widget _experienceSection(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Experience",
          description:
              "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. -by Steve Jobs",
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
          description:
              "A selection of professional and personal projects, showcasing real-world problem solving across ISP management, business productivity, education systems, and travel.",
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
          description: "Academic background with a strong foundation in computer science and engineering.",
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
          // CTA banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: seedColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: const Border(
                left: BorderSide(color: seedColor, width: 3),
              ),
            ),
            child: Text(
              "Available for freelance projects and full-time opportunities",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
          const Gap(16),
          Center(child: Lottie.asset(coderAstronaut, width: lottieSize, height: lottieSize)),
          const Gap(10),
          Row(
            children: [
              Text("Get in touch", style: Theme.of(context).textTheme.titleLarge),
              const Gap(8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green.withValues(alpha: 0.5)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: Colors.green, size: 7),
                    Gap(5),
                    Text(
                      "Open to freelance",
                      style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(10),
          const ContactInfoRow(icon: phoneIcon, text: phone),
          const Gap(5),
          const ContactInfoRow(icon: emailIcon, text: email),
          const Gap(5),
          const ContactInfoRow(icon: addressIcon, text: address),
          const Gap(5),
          const ContactInfoRow(icon: linkedInIcon, text: "LinkedIn", url: linkedInLink),
          const Gap(5),
          const ContactInfoRow(icon: githubIcon, text: "GitHub", url: githubLink),
          const Gap(5),
          const ContactInfoRow(icon: teamsIcon, text: "Teams", url: teamsLink),
          const Gap(20),
          Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
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
