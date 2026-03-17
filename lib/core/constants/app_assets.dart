import 'package:portfolio/data/model/education_model.dart';
import 'package:portfolio/data/model/project_model.dart';
import 'package:portfolio/data/model/skill_model.dart';

const String profileImage = "assets/images/portfolio.png";
const String backgroundImage = "assets/images/stars.jpg";

// App Icons
const String linkedInIcon = "assets/svgs/linkedin.svg";
const String githubIcon = "assets/svgs/github-logo.svg";
const String teamsIcon = "assets/svgs/teams.svg";
const String phoneIcon = "assets/svgs/phone.svg";
const String emailIcon = "assets/svgs/email.svg";
const String addressIcon = "assets/svgs/address.svg";

// Skill Icons
const String cProgramIcon = "assets/svgs/c-programming-logo.svg";
const String dartProgramIcon = "assets/svgs/dart-programming-logo.svg";
const String flutterIcon = "assets/svgs/flutter-logo.svg";
const String firebaseIcon = "assets/svgs/firebase-logo.svg";
const String gitIcon = "assets/svgs/git-logo.svg";
const String githubSkillIcon = "assets/svgs/github-logo.svg";
const String gitlabSkillIcon = "assets/svgs/gitlab-logo.svg";

const List<Skill> skillsList = [
  // Framework
  Skill(flutterIcon, "Flutter", "Building cross-platform mobile apps with Flutter, creating seamless and performant UIs.", category: "Framework"),
  Skill(dartProgramIcon, "Dart", "Strong in Dart — the core language of Flutter — for building robust, type-safe applications.", category: "Languages"),
  // State Management
  Skill("", "Riverpod", "Advanced reactive state management for scalable, testable Flutter applications.", category: "State Management"),
  Skill("", "Bloc / Cubit", "Event-driven state management using the BLoC pattern for complex business logic.", category: "State Management"),
  // Architecture
  Skill("", "Clean Architecture", "Designing layered, decoupled codebases with domain, data, and presentation separation.", category: "Architecture & Patterns"),
  Skill("", "MVVM", "Applying the Model-View-ViewModel pattern for maintainable, testable Flutter apps.", category: "Architecture & Patterns"),
  Skill("", "SOLID Principles", "Applying SOLID design principles for extensible, maintainable object-oriented code.", category: "Architecture & Patterns"),
  // Backend
  Skill(firebaseIcon, "Firebase", "Integrating Firebase for authentication, Firestore, Cloud Messaging, and storage.", category: "Backend & APIs"),
  Skill("", "REST API", "Integrating RESTful APIs with Dio and http packages, including auth token handling.", category: "Backend & APIs"),
  // Tools
  Skill(gitIcon, "Git", "Version control expertise with Git for managing code efficiently across teams.", category: "Tools"),
  Skill(githubSkillIcon, "GitHub", "Repository management, code review, and collaboration via GitHub.", category: "Tools"),
  Skill(gitlabSkillIcon, "GitLab", "CI/CD pipelines and project management using GitLab.", category: "Tools"),
  Skill(cProgramIcon, "C Programming", "Solid foundation in C, with knowledge in algorithms and memory management.", category: "Languages"),
];

/// Returns skills grouped by category in display order.
Map<String, List<Skill>> get groupedSkills {
  const order = [
    'Framework',
    'Languages',
    'State Management',
    'Architecture & Patterns',
    'Backend & APIs',
    'Tools',
  ];
  final Map<String, List<Skill>> grouped = {};
  for (final cat in order) {
    grouped[cat] = skillsList.where((s) => s.category == cat).toList();
  }
  return grouped;
}

// Lottie Files
const String coderAstronaut = "assets/lottie_files/coder_astronaut.json";

// Education
const List<Education> educationList = [
  Education(
    degree: "B.Sc. in Computer Science & Engineering",
    institution: "Daffodil International University",
    period: "2019 – 2023",
    grade: "CGPA 3.57 / 4.00",
    highlights: [
      "Built a strong foundation in software engineering, data structures, algorithms, and OOP concepts.",
      "Gained hands-on experience with mobile application development using Flutter and Dart.",
      "Completed multiple academic projects focused on real-world problem solving and system design.",
      "Final Year Project: ExplorerGo — a Flutter-based travel application with authentication and payment integration.",
    ],
  ),
  Education(
    degree: "Higher Secondary Certificate (HSC)",
    institution: "Govt. Hazi Ibrahim Alamchan Model School & College",
    period: "2017 – 2019",
    grade: "GPA 4.00 / 5.00",
    highlights: [
      "Field of study: Science.",
    ],
  ),
  Education(
    degree: "Secondary School Certificate (SSC)",
    institution: "Govt. Hazi Ibrahim Alamchan Model School & College",
    period: "2015 – 2017",
    grade: "GPA 4.91 / 5.00",
    highlights: [
      "Field of study: Science.",
    ],
  ),
];

// Projects
const List<Project> projectsList = [
  Project(
    title: "ISP Digital",
    subtitle: "A comprehensive ISP management application",
    highlights: [
      "Led development of business-critical modules including billing, invoicing, client management, and payment workflows.",
      "Designed an offline-first client draft system using Drift (SQLite ORM) for seamless onboarding without data loss.",
      "Architected robust form handling and validation workflows for large-scale data entry.",
      "Built dynamic, role-based UI systems adapting to user types and subscription states.",
      "Applied Clean Architecture and modular design principles for long-term scalability.",
    ],
    techStack: ["Flutter", "Dart", "Riverpod", "Drift", "REST API", "Clean Architecture"],
  ),
  Project(
    title: "Biznify",
    subtitle: "A business management and productivity application",
    highlights: [
      "Designed and implemented a modern dashboard UI.",
      "Built modular and reusable widgets to accelerate feature development.",
      "Worked on data-driven screens, reports, and user interaction flows.",
      "Ensured responsiveness and smooth UX across different screen sizes.",
    ],
    techStack: ["Flutter", "Dart", "Provider", "REST API"],
  ),
  Project(
    title: "Edufy",
    subtitle: "An education management system with multiple user roles",
    highlights: [
      "Developed role-based modules for Admin, Teacher, Student, and Employee.",
      "Implemented dynamic theming and localization using state management.",
      "Worked on complex nested data models for student exams, marks, and academic records.",
      "Built editable dialog-based workflows with temporary state handling and save/cancel behavior.",
    ],
    techStack: ["Flutter", "Dart", "Bloc/Cubit", "REST API"],
  ),
  Project(
    title: "ExplorerGo",
    subtitle: "Final Year Project — Flutter travel app with auth & payment",
    highlights: [
      "Designed and built a full-featured travel exploration app as a Final Year Project.",
      "Implemented secure user authentication (Firebase Auth) and user profile management.",
      "Integrated payment gateway for booking and transaction workflows.",
      "Applied modular architecture patterns for scalable feature growth.",
    ],
    techStack: ["Flutter", "Dart", "Firebase", "REST API", "Stripe"],
  ),
];
