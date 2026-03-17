import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/data/model/project_model.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered
                ? seedColor.withValues(alpha: 0.55)
                : Colors.white.withValues(alpha: 0.06),
          ),
          boxShadow: [
            if (_hovered)
              BoxShadow(
                color: seedColor.withValues(alpha: 0.18),
                blurRadius: 24,
                spreadRadius: 0,
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          seedColor.withValues(alpha: 0.2),
                          seedColorCyan.withValues(alpha: 0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: seedColor.withValues(alpha: 0.25)),
                    ),
                    child: const Icon(Icons.phone_android, color: seedColor, size: 20),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        Text(
                          widget.project.subtitle,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: seedColor,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
              const Gap(10),
              ...widget.project.highlights.map(
                (point) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: seedColorCyan.withValues(alpha: 0.8),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const Gap(8),
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
              if (widget.project.techStack.isNotEmpty) ...[
                const Gap(12),
                Wrap(
                  spacing: 6,
                  runSpacing: 5,
                  children: widget.project.techStack.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: seedColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: seedColor.withValues(alpha: 0.25)),
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
              ],
            ],
          ),
        ),
      ),
    );
  }
}
