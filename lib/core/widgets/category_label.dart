import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class CategoryLabel extends StatelessWidget {
  final String label;
  final double lineWidth;
  final double letterSpacing;

  const CategoryLabel({super.key, required this.label, this.lineWidth = 24, this.letterSpacing = 1.8});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: lineWidth, height: 1, color: seedColor.withValues(alpha: 0.4)),
        const Gap(8),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: seedColor.withValues(alpha: 0.9),
                letterSpacing: letterSpacing,
                fontWeight: FontWeight.w700,
              ),
        ),
        const Gap(8),
        Container(width: lineWidth, height: 1, color: seedColor.withValues(alpha: 0.4)),
      ],
    );
  }
}
