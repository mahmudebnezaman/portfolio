import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/data/model/skill_model.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;
  final double iconSize;
  final double? titleFontSize;
  final bool showDescription;

  const SkillCard({
    super.key,
    required this.skill,
    this.iconSize = 60,
    this.titleFontSize,
    this.showDescription = false,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIcon(),
              const Gap(8),
              Text(
                widget.skill.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontSize: widget.titleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
              if (widget.showDescription && widget.skill.description.isNotEmpty) ...[
                const Gap(4),
                Text(
                  widget.skill.description,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const Gap(4),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (widget.skill.icon.isNotEmpty) {
      return SvgPicture.asset(widget.skill.icon, height: widget.iconSize);
    }
    final abbr = widget.skill.title
        .split(' ')
        .where((w) => w.isNotEmpty)
        .map((w) => w[0])
        .take(2)
        .join()
        .toUpperCase();
    return Container(
      width: widget.iconSize,
      height: widget.iconSize,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            seedColor.withValues(alpha: 0.2),
            seedColorCyan.withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: seedColor.withValues(alpha: 0.3)),
      ),
      child: Center(
        child: Text(
          abbr,
          style: TextStyle(
            color: seedColor,
            fontSize: widget.iconSize * 0.28,
            fontWeight: FontWeight.w700,
            fontFamily: 'Sora',
          ),
        ),
      ),
    );
  }
}
