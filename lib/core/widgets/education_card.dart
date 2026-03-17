import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/data/model/education_model.dart';

class EducationCard extends StatelessWidget {
  final Education education;

  const EducationCard({super.key, required this.education});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        education.degree,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Gap(4),
                      Text(
                        education.institution,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: seedColor,
                            ),
                      ),
                    ],
                  ),
                ),
                const Gap(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      education.period,
                      style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                    const Gap(4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: seedColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        education.grade,
                        style: const TextStyle(
                          color: seedColor,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (education.highlights.isNotEmpty) ...[
              const Gap(10),
              const Divider(height: 1),
              const Gap(10),
              ...education.highlights.map(
                (point) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Expanded(
                        child: Text(
                          point,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
