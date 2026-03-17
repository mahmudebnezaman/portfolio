import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class ExperienceCard extends StatelessWidget {
  final VoidCallback onContactPressed;

  const ExperienceCard({super.key, required this.onContactPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: logo + company info + period badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/softifybd.png',
                        height: 56,
                        width: 56,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const Gap(14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Softifybd Limited',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(3),
                      Text(
                        'Cross Platform Application Specialist Engineer',
                        style: TextStyle(color: seedColor, fontSize: 13.0, fontWeight: FontWeight.w500),
                      ),
                      Gap(4),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: Colors.grey, size: 13),
                          Gap(3),
                          Text('Dhaka, Bangladesh', style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: seedColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Jun 2024 – Present',
                    style: TextStyle(color: seedColor, fontSize: 11.0, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const Gap(16),
            const Divider(height: 1),
            const Gap(14),
            // Responsibilities
            Text(
              'Responsibilities',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Gap(8),
            ..._responsibilities.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Icon(Icons.circle, color: seedColor, size: 6),
                    ),
                    const Gap(8),
                    Expanded(
                      child: Text(item, style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(14),
            // Key projects chips
            Text(
              'Key Projects',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Gap(8),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: _keyProjects.map((project) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    project,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white70),
                  ),
                );
              }).toList(),
            ),
            const Gap(14),
            // Tech stack chips
            Text(
              'Tech Stack',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Gap(8),
            Wrap(
              spacing: 6,
              runSpacing: 5,
              children: _techStack.map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: seedColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: seedColor.withValues(alpha: 0.3)),
                  ),
                  child: Text(
                    tech,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: seedColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                );
              }).toList(),
            ),
            const Gap(16),
            // Contact button
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: seedColor.withValues(alpha: 0.1),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
              onPressed: onContactPressed,
              child: const Text(
                'CONTACT ME',
                style: TextStyle(color: seedColor, fontWeight: FontWeight.bold, fontSize: 13.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> _responsibilities = [
  'Building scalable, maintainable, and user-centric cross-platform mobile applications using Flutter & Dart.',
  'Applying Clean Architecture and MVVM/feature-based patterns to ensure long-term testability and scalability.',
  'Integrating advanced state management solutions including Riverpod, Bloc/Cubit, and Provider.',
  'Developing REST API integrations, Firebase services, and local storage solutions using Drift (SQLite ORM).',
  'Collaborating with cross-functional teams to deliver reliable, high-quality products on tight schedules.',
];

const List<String> _keyProjects = [
  'ISP Digital',
  'Biznify',
  'Edufy',
];

const List<String> _techStack = [
  'Flutter',
  'Dart',
  'Riverpod',
  'Bloc/Cubit',
  'Drift',
  'Firebase',
  'REST API',
  'Clean Architecture',
];
