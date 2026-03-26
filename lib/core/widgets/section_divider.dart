import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class SectionDivider extends StatelessWidget {
  final double verticalPadding;

  const SectionDivider({super.key, required this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: Colors.white.withValues(alpha: 0.06))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
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
}
