class Project {
  final String title;
  final String subtitle;
  final List<String> highlights;
  final List<String> techStack;

  const Project({
    required this.title,
    required this.subtitle,
    required this.highlights,
    this.techStack = const [],
  });
}
