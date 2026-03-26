import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_texts.dart';
import 'package:portfolio/core/widgets/contact_info_row.dart';

class ContactInfoPanel extends StatelessWidget {
  final double lottieSize;
  final TextStyle? titleStyle;

  const ContactInfoPanel({super.key, required this.lottieSize, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
        const Gap(20),
        Lottie.asset(coderAstronaut, width: lottieSize, height: lottieSize),
        const Gap(16),
        Row(
          children: [
            Text(
              "Get in touch",
              style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(10),
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
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(12),
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
      ],
    );
  }
}
