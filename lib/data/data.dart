
import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

const mobileSizeBorder = 1000;

const String backendResume = "https://github.com/bruc3balo/bruc3balo.github.io/releases/download/backend/BruceOmukokoBackendResume.pdf";
const String flutterResume = "https://github.com/bruc3balo/bruc3balo.github.io/releases/download/flutter/BruceOmukokoFlutterDeveloper.pdf";

final Technologies springTechnology = Technologies(
  name: 'Spring Framework',
  brief:
  'Spring is a comprehensive Java framework used to develop high-performance, secure, and scalable backend applications. It simplifies backend development, making it ideal for creating microservices, APIs, and enterprise systems.',
  url: 'https://spring.io/projects/spring-framework',
  startDate: DateTime(2021, DateTime.august),
  cover: SvgPicture.asset(
    "bruc3balo/assets/spring.svg",
    fit: BoxFit.contain,
    color: HexColor("#77bc1f"),
  ),
  abilities: [
    const Ability(
      name: 'USSD Applications',
      brief:
      "Designed dynamic USSD menus with advanced session tracking, enabling interactive mobile services accessible without internet.",
    ),
    const Ability(
      name: 'Spring Data',
      brief:
      'Proficient in efficient database operations using Spring Data and Hibernate, optimizing data access layers for seamless performance.',
      points: [
        "Designed data models and implemented entities for database interaction.",
        "Developed versatile queries using JPA Specifications and JPQL.",
        "Optimized database performance with paging, indexing, and constraints.",
        "Streamlined schema management with Hibernate ORM.",
      ],
    ),
    const Ability(
      name: 'Spring Security',
      brief:
      'Secured applications using advanced authentication and authorization mechanisms, enhancing user experience and data protection.',
      points: [
        "Implemented JWT-based authentication and multi-factor authorization.",
        "Controlled endpoint and method-level access for sensitive data.",
        "Enabled secure multi-tenant systems based on user roles.",
      ],
    ),
    const Ability(
      name: 'Microservices',
      brief:
      'Built resilient microservices using Spring Boot, messaging queues, and API gateways to ensure seamless inter-service communication.',
      points: [
        "Integrated microservices using messaging systems for asynchronous operations.",
        "Externalized configurations for dynamic and flexible deployments.",
        "Designed batch processing systems for high-volume tasks.",
      ],
    ),
  ],
);
final Technologies dockerTechnology = Technologies(
  name: 'Docker',
  brief:
  "Docker revolutionizes application deployment by packaging software and dependencies into portable containers for consistent environments.",
  url: 'https://www.docker.com',
  startDate: DateTime(2022, DateTime.august),
  cover: SvgPicture.asset(
    "bruc3balo/assets/docker.svg",
    fit: BoxFit.contain,
  ),
  abilities: [
    const Ability(
      name: 'Dockerfile Authoring',
      brief:
      "Authored Dockerfiles for seamless containerization, enabling consistent application deployment across environments.",
      points: [
        "Created lightweight images using multistage builds and slim base images.",
        "Externalized configurations for flexibility and maintainability.",
      ],
    ),
    const Ability(
      name: 'Private Registry Management',
      brief:
      'Set up private Docker registries to secure container images and control access for team collaboration.',
      url:
      'https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-22-04',
      points: [
        "Configured basic authentication for registry security.",
        "Managed private images with controlled access for internal use.",
      ],
    ),
    const Ability(
      name: 'Testing with Docker Compose',
      brief:
      "Streamlined testing environments using Docker Compose for multi-service orchestration.",
      url: 'https://docs.docker.com/compose',
      points: [
        "Created modular Compose files for isolated service testing.",
        "Extended and reused Compose configurations for efficient testing setups.",
      ],
    ),
  ],
);
final Technologies kubernetesTechnology = Technologies(
  name: 'Kubernetes',
  brief:
  "Kubernetes automates deployment, scaling, and management of containerized applications, ensuring optimal resource utilization.",
  url: 'https://kubernetes.io',
  startDate: DateTime(2024, DateTime.february),
  cover: SvgPicture.asset(
    "bruc3balo/assets/kubernets.svg",
    fit: BoxFit.contain,
  ),
  abilities: const [
    Ability(
      name: 'Deployment and Scaling',
      brief:
      "Orchestrated deployments with auto-scaling for dynamic workloads.",
      points: [
        "Implemented replica sets for scaling.",
        "Enabled auto-scaling based on CPU, memory, and request metrics.",
      ],
    ),
    Ability(
      name: 'Networking and Traffic Management',
      brief:
      "Managed seamless network communication and traffic routing within Kubernetes clusters.",
      points: [
        "Exposed services internally and externally with Nginx ingress.",
        "Provisioned load balancers for distributed traffic handling.",
      ],
    ),
    Ability(
      name: 'Configuration and Secrets Management',
      brief:
      "Centralized management of application secrets and configurations for enhanced security.",
      points: [
        "Utilized ConfigMaps for dynamic application settings.",
        "Stored sensitive data securely in encrypted Git repositories.",
      ],
    ),
    Ability(
      name: 'Monitoring and Health Checks',
      brief:
      "Ensured application availability with readiness and liveness probes.",
      points: [
        "Configured HTTP and TCP probes to monitor pod health and traffic readiness.",
      ],
    ),
  ],
);
final Technologies gitTechnology = Technologies(
  name: 'Git',
  brief:
  "Git is a version control system that enables collaborative development, efficient tracking of changes, and robust branching workflows for codebases.",
  startDate: DateTime(2017, DateTime.august),
  url: 'https://github.com',
  cover: SvgPicture.asset(
    "bruc3balo/assets/git.svg",
    fit: BoxFit.contain,
  ),
  abilities: const [
    Ability(
      name: 'Repository Management',
      brief:
      "Expertise in managing Git repositories to ensure clean and structured version control.",
      points: [
        "Created and cloned repositories for efficient collaboration.",
        "Managed updates to both local and remote repositories seamlessly.",
      ],
    ),
    Ability(
      name: 'Branch Management',
      brief:
      "Proficient in handling branches for parallel development and streamlined code integration.",
      points: [
        "Merged branches for integrating features and bug fixes.",
        "Performed rebasing to maintain a linear history.",
        "Recovered and fast-forwarded branches for consistent updates.",
      ],
    ),
    Ability(
      name: 'Commit Management',
      brief:
      "Skillful in commit handling to maintain a reliable and traceable project history.",
      points: [
        "Checked out specific commits to debug or review changes.",
        "Cherry-picked commits for selective integration.",
        "Created new branches from existing commits for feature isolation.",
      ],
    ),
  ],
);
final Technologies nativeAndroidTechnology = Technologies(
  name: 'Native Android',
  brief:
  "With over 5 years of experience, I specialize in creating robust Android applications using Java, XML layouts, and the MVVM architecture, ensuring scalability, maintainability, and user satisfaction.",
  url: 'https://developer.android.com',
  startDate: DateTime(2020, DateTime.may),
  cover: SvgPicture.asset(
    "bruc3balo/assets/android.svg",
    height: 300,
    width: 300,
    color: Colors.green,
  ),
  abilities: const [
    Ability(
      name: 'Android SDK',
      brief:
      "Comprehensive knowledge of Android SDK components, enabling efficient app development and lifecycle management.",
      points: [
        "Designed interactive user interfaces using activities and fragments.",
        "Integrated Room database for robust local storage.",
        "Utilized LiveData and ViewModel for reactive programming.",
      ],
    ),
    Ability(
      name: 'Java Logic Programming',
      brief:
      "Developed clean and efficient backend logic using Java 8/11 features.",
      points: [
        "Implemented background processing for smooth user experiences.",
        "Designed robust error-handling mechanisms for high reliability.",
      ],
    ),
    Ability(
      name: 'XML Layouts',
      brief:
      "Designed visually appealing UI components following Material Design principles.",
      points: [
        "Modularized layouts for reusable components.",
        "Leveraged DataBinding to reduce boilerplate code and enhance readability.",
      ],
    ),
  ],
);
final Technologies flutterTechnology = Technologies(
  name: 'Flutter',
  brief:
  "Flutter is a modern cross-platform framework that enables rapid development of high-performance, visually stunning mobile applications.",
  url: 'https://flutter.dev',
  startDate: DateTime(2021, DateTime.january),
  cover: SvgPicture.asset(
    "bruc3balo/assets/flutter.svg",
    fit: BoxFit.contain,
  ),
  abilities: const [
    Ability(
      name: 'Cross-Platform Development',
      brief:
      "Build mobile applications for iOS and Android from a single codebase using Flutter and Dart.",
      points: [
        "Developed responsive UIs with Flutter's flexible widgets.",
        "Integrated RESTful APIs for real-time data synchronization.",
      ],
    ),
    Ability(
      name: 'State Management',
      brief:
      "Efficiently manage app state using providers, Riverpod, and Bloc architectures.",
      points: [
        "Implemented complex navigation flows with dynamic state handling.",
        "Optimized performance by reducing unnecessary widget rebuilds.",
      ],
    ),
    Ability(
      name: 'Firebase Integration',
      brief:
      "Seamlessly integrated Firebase services to enhance app functionality.",
      points: [
        "Implemented Firebase Authentication for secure login flows.",
        "Utilized Firestore for real-time data storage and retrieval.",
      ],
    ),
  ],
);
final Technologies riveTechnology = Technologies(
  name: 'Rive',
  brief:
  "Rive is a powerful design and animation tool used for creating interactive vector animations and illustrations for various digital platforms.",
  startDate: DateTime(2022, DateTime.march),
  cover: Image.asset(
    "bruc3balo/assets/rive.png",
    fit: BoxFit.contain,
    width: 300,
    height: 300,
  ),
  url: 'https://rive.app',
  abilities: const [
    Ability(
      name: 'Animating vectors',
      brief:
      'Skilled in animating vector graphics, enhancing visual appeal and interactivity in digital designs for dynamic user experiences.',
    ),
    Ability(
      name: 'State animations',
      brief:
      "Skilled in implementing state animations using state machines, effectively managing and controlling application states to create dynamic and responsive user interfaces.",
    ),
  ],
);
final Technologies adobeIllustratorTechnology = Technologies(
  name: 'Adobe illustrator',
  brief:
  "Adobe Illustrator is a versatile vector graphics editor used for creating scalable illustrations, logos, icons, and other graphical elements for print, web, and multimedia projects.",
  startDate: DateTime(2022, DateTime.march),
  cover: SvgPicture.asset("bruc3balo/assets/adobe-illustrator.svg"),
  url: 'https://www.adobe.com/products/illustrator.html',
  abilities: const [
    Ability(
      name: 'Character modelling',
      brief:
      "Proficient in character drawing using Adobe Illustrator, leveraging its powerful vector-based tools to create detailed and expressive characters for various digital media and design projects.",
      points: [
        "Utilized vector paths for precision in character creation.",
        "Incorporated layers and grouping for complex designs.",
        "Adapted designs for both print and digital platforms.",
      ],
    ),
  ],
);
final Technologies postgresTechnology = Technologies(
  name: 'PostgreSQL',
  brief:
  "PostgreSQL is a powerful, open-source relational database known for its extensibility, reliability, and performance.",
  url: 'https://www.postgresql.org',
  startDate: DateTime(2020, DateTime.july),
  cover: SvgPicture.asset(
    "bruc3balo/assets/postgresql.svg",
    fit: BoxFit.contain,
  ),
  abilities: const [
    Ability(
      name: 'Database Design',
      brief:
      "Proficient in designing normalized database schemas for scalable and efficient data storage.",
      points: [
        "Created relational schemas with primary and foreign keys for data integrity.",
        "Optimized table indexing for faster query performance.",
      ],
    ),
    Ability(
      name: 'Advanced Querying',
      brief:
      "Developed advanced SQL queries to meet complex application needs.",
      points: [
        "Implemented complex joins and subqueries for data retrieval.",
        "Utilized aggregate functions and window functions for analytics.",
      ],
    ),
    Ability(
      name: 'Performance Optimization',
      brief:
      "Ensured optimal database performance through tuning and monitoring.",
      points: [
        "Analyzed and optimized slow queries using EXPLAIN plans.",
        "Managed connection pools for high-concurrency scenarios.",
      ],
    ),
    Ability(
      name: 'Data Security',
      brief:
      "Implemented robust security measures for sensitive data protection.",
      points: [
        "Set up roles and permissions for controlled data access.",
        "Utilized SSL encryption to secure database connections.",
      ],
    ),
  ],
);
final Technologies mysqlTechnology = Technologies(
  name: 'MySQL',
  brief:
  "MySQL is a widely-used relational database known for its simplicity, speed, and reliability in managing structured data.",
  url: 'https://www.mysql.com',
  startDate: DateTime(2020, DateTime.june),
  cover: SvgPicture.asset(
    "bruc3balo/assets/mysql.svg",
    fit: BoxFit.contain,
  ),
  abilities: const [
    Ability(
      name: 'Database Design',
      brief:
      "Proficient in designing normalized schemas for structured data storage.",
      points: [
        "Created efficient table structures to enforce data integrity.",
        "Optimized database relations with foreign keys and indexing.",
      ],
    ),
    Ability(
      name: 'Query Optimization',
      brief:
      "Improved application performance by optimizing database queries.",
      points: [
        "Analyzed slow queries using EXPLAIN for optimization.",
        "Implemented indexing to boost query execution speed.",
      ],
    ),
    Ability(
      name: 'Data Backup and Recovery',
      brief:
      "Ensured data durability with robust backup and recovery mechanisms.",
      points: [
        "Automated database backups for regular snapshots.",
        "Restored critical data efficiently during outages or failures.",
      ],
    ),
  ],
);
final Technologies mongoDbTechnology = Technologies(
  name: 'MongoDB',
  brief:
  "MongoDB is a high-performance NoSQL database designed for flexible, scalable, and document-oriented storage, catering to modern, data-intensive applications.",
  startDate: DateTime(2021, DateTime.august),
  cover: SvgPicture.asset(
    "bruc3balo/assets/mongo.svg",
    height: 300,
    width: 300,
  ),
  url: 'https://www.mongodb.com',
  abilities: const [
    Ability(
      name: 'Data Modeling',
      brief:
      "Expertise in designing and implementing flexible document-based schemas that align with application requirements.",
      points: [
        "Created dynamic schemas for rapid development.",
        "Designed indexes to optimize query performance.",
        "Managed relationships using embedded documents and references.",
      ],
    ),
    Ability(
      name: 'Scalability and Performance',
      brief:
      "Proficient in scaling MongoDB clusters and optimizing performance for high-throughput operations.",
      points: [
        "Configured sharding for large-scale data distribution.",
        "Tuned performance using profiling and monitoring tools.",
      ],
    ),
  ],
);
final Technologies visualParadigmTechnology = Technologies(
  name: 'Visual Paradigm',
  brief:
  "Visual Paradigm is a robust tool for software and business process modeling, offering UML diagrams, agile tools, and collaboration capabilities to enhance system design and documentation.",
  startDate: DateTime(2020, DateTime.january),
  cover: Image.asset("bruc3balo/assets/visual-paradigm.png"),
  url: 'https://www.visual-paradigm.com',
  abilities: const [
    Ability(
      name: 'Activity Diagrams',
      brief:
      "Proficient in creating activity diagrams to model workflows, enabling clear visualization of system processes and interactions.",
      points: [
        "Modeled complex workflows for software systems.",
        "Analyzed and optimized processes using clear diagrams.",
      ],
      url:
      'https://www.visual-paradigm.com/tutorials/how-to-draw-activity-diagram-in-uml',
    ),
    Ability(
      name: 'Data Flow Diagrams (DFD)',
      brief:
      "Skilled in illustrating system data flows with DFDs, providing clarity in data processing and system analysis.",
      points: [
        "Visualized data movement between processes and entities.",
        "Used DFDs to facilitate efficient communication with stakeholders.",
      ],
      url:
      'https://www.visual-paradigm.com/tutorials/data-flow-diagram-dfd.jsp',
    ),
    Ability(
      name: 'Entity-Relationship Diagrams (ERD)',
      brief:
      "Experienced in crafting ERDs for database design, highlighting entity relationships, attributes, and structural organization.",
      points: [
        "Designed comprehensive ERDs to streamline database implementation.",
        "Simplified data relationships for enhanced database normalization.",
      ],
      url:
      'https://www.visual-paradigm.com/tutorials/databasedesign.jsp',
    ),
  ],
);

List<SkillBoard> get skills => [
  SkillBoard(
    name: 'Backend Development',
    color: Colors.red,
    brief:
    'As a seasoned backend developer, I specialize in crafting robust architectures and optimizing performance to ensure seamless operation of backend systems. With a keen focus on security, I implement stringent measures to safeguard sensitive data and protect against potential threats. My expertise lies in architecting scalable solutions that deliver high performance and reliability, while prioritizing the integrity and confidentiality of backend systems. I am committed to staying abreast of the latest advancements in backend technologies to continuously enhance system efficiency and resilience.',
    technologies: [
      springTechnology,
    ],
  ),
  SkillBoard(
    name: 'DevOps',
    color: Colors.blueGrey,
    brief:
    'As a dedicated DevOps engineer, I specialize in ensuring high availability, stability, and seamless operations of complex environments. With a relentless focus on eliminating downtime, I implement robust strategies and automation techniques to maintain uninterrupted service delivery. My expertise extends to orchestrating secure networking communications between all nodes, implementing encryption protocols, and enforcing stringent access controls to safeguard sensitive data. Through continuous monitoring, optimization, and automation, I strive to create resilient infrastructures that meet the highest standards of reliability and security',
    technologies: [
      dockerTechnology,
      kubernetesTechnology,
      gitTechnology,
    ],
  ),
  SkillBoard(
    name: 'Mobile Development',
    color: Colors.green,
    brief:
    "Proficient in mobile development, encompassing both Android native and Flutter cross-platform development, with expertise in creating high-quality, user-friendly mobile applications for diverse platforms and devices.",
    technologies: [
      nativeAndroidTechnology,
      flutterTechnology,
    ],
  ),
  SkillBoard(
    name: 'Vector Graphics',
    color: Colors.brown,
    brief:
    'Proficient in creating vector graphics using Adobe Illustrator and animating them seamlessly using Rive, enhancing visual appeal and interactivity in digital designs.',
    technologies: [
      riveTechnology,
      adobeIllustratorTechnology,
    ],
  ),
  SkillBoard(
    name: 'Database administrations',
    color: Colors.deepOrangeAccent,
    brief:
    "Proficient in database administration, encompassing tasks such as database installation, configuration, performance tuning, backup and recovery, security management, and troubleshooting, ensuring optimal functionality, reliability, and security of database systems.",
    technologies: [
      postgresTechnology,
      mysqlTechnology,
      mongoDbTechnology,
    ],
  ),
  SkillBoard(
    name: 'UML visualization',
    color: Colors.white,
    brief:
    "Proficient in UML (Unified Modeling Language) visualization, utilizing industry-standard diagrams and notations to depict system architectures, design patterns, and software processes, facilitating clear communication and collaboration among project stakeholders.",
    technologies: [
      visualParadigmTechnology
    ],
  ),
];

class Ability {
  final String name;
  final String brief;
  final List<String> points;
  final String? url;

  const Ability({
    required this.name,
    required this.brief,
    this.points = const [],
    this.url,
  });
}

class Technologies {
  final String name;
  final String brief;
  final String url;
  final Widget cover;
  final DateTime startDate;
  final Curve curves;
  final List<Ability> abilities;

  const Technologies({
    required this.name,
    required this.brief,
    required this.cover,
    this.curves = Curves.linear,
    required this.startDate,
    required this.url,
    this.abilities = const [],
  });

  String get xp {
    var xp = DateTime.now().difference(startDate);
    return experience(xp);
  }
}

class SkillBoard {
  final String name;
  final Color color;
  final String brief;
  final List<Technologies> technologies;

  const SkillBoard({
    required this.color,
    required this.name,
    required this.brief,
    this.technologies = const [],
  });
}

class Project {
  final Widget cover;
  final String name;
  final String about;
  final String url;
  final List<Technologies> stack;

  const Project({
    required this.cover,
    required this.name,
    required this.about,
    required this.url,
    this.stack = const [],
  });
}

class Event {
  final String name;
  final String about;
  final String content;
  final DateTime date;

  const Event({
    required this.name,
    required this.about,
    required this.content,
    required this.date,
  });
}

enum PubPackage {
  spinnerDatePicker,
  lruMemoryCache;
}