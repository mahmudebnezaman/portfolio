import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_texts.dart';
import 'package:portfolio/core/widgets/contact_info_row.dart';
import 'package:portfolio/core/widgets/large_screen_appbar.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experience = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onNavButtonPressed: (section) {
          if (section == "Home") {
            scrollToSection(_homeKey);
          } else if (section == "Skills") {
            scrollToSection(_skillsKey);
          } else if (section == "Contact") {
            scrollToSection(_contactKey);
          }
        },
      ),
      body: Stack(
        children: [
          Image.asset(
            backgroundImage,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                children: <Widget>[
                  // Home Section
                  Container(
                    key: _homeKey,
                    child: homeSection(context),
                  ),
                  // Skills Section
                  Container(
                    key: _skillsKey,
                    child: skillSection(context),
                  ),
                  const Gap(100),
                  // Experience Section
                  Container(
                    key: _experience,
                    child: experienceSection(context),
                  ),
                  // Contact Section
                  Container(
                    key: _contactKey,
                    child: getInTouchSection(context),
                  ),
                  const Divider(),
                  Text(
                    "Developed by -Mahmud",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
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
      padding: const EdgeInsets.only(top:8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey there,",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "I'm Mahmud Ebne Zaman",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "-Mobile Application Developer",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: seedColor),
                ),
                const Gap(5),
                Text(
                  "\"I am a passionate Flutter developer with a knack for creating intuitive and engaging mobile applications. My expertise lies in building responsive UIs and implementing innovative features that enhance user experiences. I thrive on challenges and continuously seek opportunities to expand my skills and knowledge in the ever-evolving tech landscape.\"",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Gap(5),
                ElevatedButton(
                  onPressed: () {
                    scrollToSection(_contactKey);
                  },
                  child: const Text(
                    "Get in touch",
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
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
        ],
      ),
    );
  }

  Widget skillSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        children: [
          Text(
            "Skills",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.6,
            child: Text(
              "Skilled in Flutter development with a strong focus on building responsive and dynamic mobile apps. Proficient in integrating advanced UI/UX features and backend functionalities.",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(15),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: skillsList.map((skill) {
              return SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          skill.icon,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                        ),
                        const Gap(5),
                        Text(skill.title, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white, fontSize: 14), textAlign: TextAlign.center),
                        const Gap(3),
                        Text(skill.description, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
                        const Gap(5),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget experienceSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        children: [
          Text(
            "Experience",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: Text(
              "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. -by Steve Jobs",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(15),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                child: Row(
                  children: [
                    // Image section
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            'assets/images/softifybd.png', // Replace with your image URL
                            width: 160,
                            height: 120,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    // Text section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2024-Present',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Softifybd Ltd.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Intern',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Cross Platform Mobile Application Developer',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Contact button
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: seedColor.withOpacity(0.1),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          scrollToSection(_contactKey);
                        },
                        child: Text(
                          'CONTACT ME',
                          style: TextStyle(
                            color: seedColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                       ),
           ),
        ],
      ),
    );
  }

  Row getInTouchSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Lottie.asset(coderAstronaut),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(30),
                Text(
                  "Get in touch",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gap(5),
                ContactInfoRow(icon: phoneIcon, text: phone),
                const Gap(5),
                ContactInfoRow(icon: emailIcon, text: email),
                const Gap(5),
                ContactInfoRow(icon: addressIcon, text: address),
                const Gap(5),
                ContactInfoRow(
                  icon: linkedInIcon,
                  text: linkedInLink,
                  url: linkedInLink,
                ),
                const Gap(5),
                ContactInfoRow(
                  icon: githubIcon,
                  text: githubLink,
                  url: githubLink,
                ),
                const Gap(5),
                ContactInfoRow(
                  icon: skypeIcon,
                  text: skypeLink,
                  url: skypeLink,
                ),
              ]),
        ),
      ],
    );
  }
}
