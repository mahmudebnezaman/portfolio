import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String description;

  const SectionHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Gradient accent line
        Container(
          width: 44,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [seedColor, seedColorCyan],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const Gap(12),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
        ),
        const Gap(10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.65),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
