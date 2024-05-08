import 'dart:async';
import 'dart:math';

import 'package:bruce_omukoko_portfolio/main.dart';
import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

List<SkillBoard> get skills => [
      SkillBoard(
        name: 'Backend Development',
        color: Colors.red,
        brief:
            'As a seasoned backend developer, I specialize in crafting robust architectures and optimizing performance to ensure seamless operation of backend systems. With a keen focus on security, I implement stringent measures to safeguard sensitive data and protect against potential threats. My expertise lies in architecting scalable solutions that deliver high performance and reliability, while prioritizing the integrity and confidentiality of backend systems. I am committed to staying abreast of the latest advancements in backend technologies to continuously enhance system efficiency and resilience.',
        technologies: [
          Technologies(
            name: 'Spring Framework',
            brief:
                'Spring is a powerful and versatile backend framework for Java development, renowned for its maturity, extensive community support, and focus on security. With its comprehensive suite of features and modules, Spring empowers developers to build scalable, reliable, and secure applications for a wide range of use cases, from simple microservices to complex enterprise systems.',
            url: 'https://spring.io/projects/spring-framework',
            startDate: DateTime(2021, DateTime.august),
            cover: SvgPicture.asset(
              "spring.svg",
              fit: BoxFit.contain,
              color: HexColor("#77bc1f"),
            ),
            abilities: [
              const Ability(
                name: 'USSD Applications',
                brief:
                    "Proficient in developing USSD applications with expertise in designing dynamic menus and implementing session tracking functionalities",
              ),
              const Ability(
                name: 'Spring Data',
                brief:
                    'Experienced in data modeling with Spring Boot and JPA, proficient in versatile data filtering and efficient query management. Skilled in Hibernate for easy database schema generation and abstract query handling across different platforms.',
                points: [
                  "Data modeling with Spring Boot, specializing in entity creation and management.",
                  "Proficient in JPA for versatile data filtering using specifications.",
                  "Skilled in implementing paging to efficiently limit and offset database queries.",
                  "Experienced in utilizing JPQL for object-centric database queries.",
                  "Proficient in leveraging JPA for automatic SQL rule generation (e.g., keys, constraints, indexes).",
                  "Proficient in utilizing Hibernate to generate and manage database schemas effortlessly.",
                  "Experienced in using Hibernate ORM to abstract queries for different database platforms.",
                ],
              ),
              const Ability(
                name: 'Spring Security',
                brief:
                    'Expertise in securing Spring applications through filters, aspects, and JWT implementation, enabling endpoint security, method execution control, multi-tenancy, and token-based authentication with refresh functionality for enhanced user experience and security.',
                points: [
                  "Utilize filters to intercept requests, ensuring authentication and authorization.",
                  "Enable endpoint security, authentication, and authorization control.",
                  "Support multi-tenancy based on various parameters like authentication method.",
                  "Offer multiple authentication methods and support Multi-factor Authentication (MFA).",
                  "Control method execution by verifying authorization before or after execution.",
                  "Filter data to restrict access for unauthorized users.",
                  "Issue JWT access tokens to authenticated users, containing limited non-confidential details and signed for security.",
                  "Employ short-lived access tokens with refresh tokens to balance security and user experience, allowing token refresh without re-login.",
                ],
              ),
              const Ability(
                name: 'Microservices',
                brief:
                    'Proficient in microservices architecture, utilizing messaging queues for asynchronous communication, API gateways for secure user-service interaction with measures like rate limiting and fraud detection, employing multi-module development to ensure code integrity and reusability, externalizing configurations for flexibility using configuration servers like Vault or Git, and implementing batch processing for scheduled and optimized high-volume tasks with database tracking capabilities.',
                points: [
                  "Utilize message queues for asynchronous communication between services.",
                  "Implement API gateways to abstract service communication, manage user requests, and enforce measures like rate limiting and fraud detection, with authentication for server-to-server communication.",
                  "Develop microservices within a project structure ensuring that code breaking prevents project compilation, and facilitate early error detection.",
                  "Reuse code through reusable dependencies, packaged into services for modularity.",
                  "Externalize configurations to avoid code changes for property adjustments, utilizing a configuration server with storage in Vault or Git.",
                  "Enable application restarts upon configuration changes using the actuator endpoint.",
                  "Schedule and monitor jobs using a database for execution tracking and step recording.",
                  "Optimize energy usage by batching high-volume tasks for efficiency."
                ],
              ),
            ],
          ),
        ],
      ),
      SkillBoard(
        name: 'DevOps',
        color: Colors.blueGrey,
        brief:
            'As a dedicated DevOps engineer, I specialize in ensuring high availability, stability, and seamless operations of complex environments. With a relentless focus on eliminating downtime, I implement robust strategies and automation techniques to maintain uninterrupted service delivery. My expertise extends to orchestrating secure networking communications between all nodes, implementing encryption protocols, and enforcing stringent access controls to safeguard sensitive data. Through continuous monitoring, optimization, and automation, I strive to create resilient infrastructures that meet the highest standards of reliability and security',
        technologies: [
          Technologies(
            name: 'Docker',
            brief:
                "Docker simplifies application deployment by packaging them with their dependencies into portable containers, enabling consistent and efficient deployment across various environments.",
            url: 'https://www.docker.com',
            startDate: DateTime(2022, DateTime.august),
            cover: SvgPicture.asset(
              "docker.svg",
              fit: BoxFit.contain,
            ),
            abilities: [
              const Ability(
                name: 'Application Dockerfile authoring',
                brief:
                    "Dockerfile authoring involves creating configuration files for existing applications, enabling containerization for seamless deployment across different environments.",
                points: [
                  "Externalize configurations to separate them from the application code.",
                  "Define the build steps in a Dockerfile to automate the image creation process.",
                  "Utilize multistage builds to ensure images are small by including only necessary dependencies.",
                  "Opt for slim or Alpine images to further minimize the image size while still meeting application requirements.",
                ],
              ),
              const Ability(
                name: 'Creating a private image registry',
                brief:
                    'Using a private container registry involves securely storing Docker images, controlling access, ensuring compliance, enhancing performance, and enabling collaboration within a controlled environment.',
                url:
                    'https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-22-04',
                points: [
                  "Set up basic authentication to authorize selected users to the registry"
                ],
              ),
              const Ability(
                name: 'Testing with docker compose',
                brief:
                    "Utilizing Docker Compose simplifies the setup of testing environments by orchestrating dependencies and services through an easy-to-use command.",
                url: 'https://docs.docker.com/compose',
                points: [
                  "Organize individual compose files for separate services to manage them independently.",
                  "Simplify service deployment by extending other compose files and leveraging dependencies."
                ],
              ),
            ],
          ),
          Technologies(
            name: 'Kubernetes',
            brief:
                "It's used for automating deployment, scaling, and management of containerized applications, providing a robust and scalable solution for container orchestration. Having dealt with flavours such as Minikube and Microk8s",
            url: 'https://kubernetes.io',
            startDate: DateTime(2024, DateTime.february),
            cover: SvgPicture.asset(
              "kubernets.svg",
              fit: BoxFit.contain,
            ),
            abilities: const [
              Ability(
                name: 'Deployment and Scaling',
                brief:
                    "Efficiently orchestrate cluster deployments with optimal replica configurations on datacenter or node infrastructure to ensure adequate resource provisioning for application functionality.",
                points: [
                  "Provisioning pods through deployments and scaling via replica sets",
                  "Auto-scaling with auto-callers based on metrics like CPU core usage, memory usage, and number of  HTTP requests",
                ],
              ),
              Ability(
                name: "Networking and Traffic Management",
                brief:
                    "Enable seamless pod-to-node communication while efficiently managing traffic distribution across the network.",
                points: [
                  "Exposing pod networks within the cluster using internal services.",
                  "Enabling external communication with Kubernetes pods through external services and endpoints.",
                  "Managing traffic routing to pods by utilizing Nginx Ingress with domain-based routing.",
                  "Provisioning load balancers for efficient distribution of requests across nodes.",
                ],
              ),
              Ability(
                name: "Configuration and Secrets Management",
                brief:
                    "Enhance application security by centrally managing secrets within the cluster, ensuring secure access for all applications requiring them, and safeguarding configurations in the namespace with kubelet authentication.",
                points: [
                  "Managing pod configurations through config maps",
                  "Safely managing pod and application secrets stored securely and encoded in Git repositories with enhanced Git security.",
                ],
              ),
              Ability(
                name: "Storage Management",
                brief:
                    "Ensure pod volume storage integrity and consistency by provisioning claimed volumes through kubelet-managed mechanisms.",
                points: [
                  "Dynamically provisioning volumes in response to persistent volume claim requests using storage classes."
                ],
              ),
              Ability(
                name: "Resource Allocation and Optimization:",
                brief:
                    "Optimize resource allocation by assessing application needs and preparing environments accordingly, leveraging horizontal scaling to dynamically adjust resource allocation for optimal efficiency.",
                points: [
                  "Allocating pods to environments with required resources using resource requests to prevent resource starvation.",
                  "Applying resource quotas to regulate total resource usage."
                ],
              ),
              Ability(
                name: "Namespace Management",
                brief:
                    "Maximize server resource utilization by sharing available resources while segmenting Kubernetes resources to only grant visibility to applications that require them.",
                points: [
                  "Creating namespaces to effectively segment applications and resources for improved organization.",
                ],
              ),
              Ability(
                name: "Deployment Strategies and Upgrade Handling",
                brief:
                    "Ensure continuous application uptime by seamlessly creating upgraded pods and resources to replace the previous ones during deployments.",
                points: [
                  "Upgrading pods seamlessly with zero downtime using rolling updates and node pools.",
                ],
              ),
              Ability(
                name: "Monitoring and Health Checks",
                brief:
                    "Ensure consistent pod availability and traffic flow by conducting continuous health checks, directing traffic only to pods that are up and ready to receive it, and probing when pods are prepared to handle requests.",
                points: [
                  "Implementing probes such as readiness, liveness, and health checks using TCP, HTTP, and Command methods, and configuring delays, timeouts, and thresholds.",
                ],
              ),
              Ability(
                name: "Pod Termination",
                brief:
                    "Safely manage application termination signals within Kubernetes to gracefully conclude transactions, preventing data corruption and ensuring secure shutdown procedures.",
                points: [
                  "Safely terminating pods by responding to signals like preStopHook, sigterm, and sigkill."
                ],
              ),
            ],
          ),
          Technologies(
            name: 'Git',
            brief: 'brief',
            startDate: DateTime(2017, DateTime.august),
            url: 'https://github.com',
            cover: SvgPicture.asset(
              "git.svg",
              fit: BoxFit.contain,
            ),
            abilities: const [
              Ability(
                  name: 'Manage repositories',
                  brief: 'CRUD oprations on repositories',
                  points: [
                    "Create repositories",
                    "Clone repositories",
                    "Update local and remote repositories",
                  ]),
              Ability(
                name: 'Manage branch repositories',
                brief: 'operations on branches',
                points: [
                  "Merge branch repositories",
                  "Rebase branch repositores",
                  "Checkout branch repositories",
                  "Recover branch repositories",
                  "Fast Forward branch repositories",
                ],
              ),
              Ability(
                name: 'Manage commits on branches',
                brief: 'operations for commits',
                points: [
                  "Checkout on commits in branches",
                  "Cherry pich commits in branches",
                  "Create new branches from commits",
                ],
              ),
            ],
          ),
        ],
      ),
      SkillBoard(
        name: 'Mobile Development',
        color: Colors.green,
        brief:
            "Proficient in mobile development, encompassing both Android native and Flutter cross-platform development, with expertise in creating high-quality, user-friendly mobile applications for diverse platforms and devices.",
        technologies: [
          Technologies(
            name: 'Native Android',
            brief:
                'I am a seasoned Android developer with over 5 years of industry experience, proficient in Java and XML layout. My primary focus lies in implementing robust and scalable mobile applications using the MVVM (Model-View-ViewModel) architecture pattern. By leveraging MVVM, I ensure clean separation of concerns, maintainability, and testability of codebases. I possess a deep understanding of Android lifecycle, UI/UX design principles, and performance optimization techniques. With a proven track record of delivering high-quality apps, I am committed to staying updated with the latest advancements in Android development to create cutting-edge solutions that meet the evolving needs of users.',
            url: 'https://developer.android.com',
            startDate: DateTime(2020, DateTime.may),
            cover: SvgPicture.asset(
              "android.svg",
              height: 300,
              width: 300,
            ),
            abilities: const [
              Ability(
                name: 'Android SDK',
                brief:
                    "Native Android tools for building sophisticated mobile applications, including lifecycle management, UI components, permissions handling, data persistence, reactive programming, ViewModel architecture, and modularization.",
                points: [
                  "Proficient in managing Android app lifecycles, ensuring efficient resource utilization and seamless user experiences through lifecycle-aware components.",
                  "Expertise in designing and implementing activities and fragments to create interactive user interfaces, facilitating smooth navigation and modular UI development",
                  "Adept at managing necessary permissions in Android applications, ensuring compliance with security and privacy standards while providing seamless access to device resources",
                  "Skilled in integrating Room Persistence Library to provide robust local data storage solutions, enabling efficient data access and management for offline functionality",
                  "Proficient in utilizing LiveData observables to facilitate reactive UI updates, enabling real-time data synchronization and seamless interaction with user inputs.",
                  "Experienced in implementing ViewModels to manage UI-related data in a lifecycle-conscious manner, promoting separation of concerns and facilitating UI state persistence",
                  "Expertise in modularizing Android applications to enhance maintainability, scalability, and collaboration, facilitating code reuse and promoting a clean architecture design",
                ],
              ),
              Ability(
                  name: 'Java Logic Programming',
                  brief: 'Logic programming with java 8 and java 11',
                  url: 'https://www.java.com/en/download/help/whatis_java.html',
                  points: [
                    "Proficiency in utilizing Java's threading capabilities to implement asynchronous tasks and prevent UI blocking, ensuring smooth user experience",
                    "Skill in designing and structuring data models tailored for mobile environments, facilitating efficient data management within the application",
                    "Ability to implement background processing mechanisms in mobile applications to execute long-running tasks without disrupting the user interface",
                    "Proficiency in implementing robust error handling mechanisms to identify, handle, and gracefully recover from errors encountered during application execution, enhancing application reliability and stability",
                  ]),
              Ability(
                name: 'XML Layouts',
                brief: 'Creating layouts with xml',
                url:
                    'https://developer.android.com/develop/ui/views/layout/declaring-layout',
                points: [
                  "Use databinding to seamlessly connect user interface components with data sources, improving code readability and reducing boilerplate code in Android development.",
                  "Create bespoke UI components tailored to specific application requirements, enhancing user experience and interface design flexibility.",
                  "Modularize UI components and enhance code reusability by dividing the user interface into independent, reusable sections in Android apps",
                  "Design visually appealing and intuitive user interfaces following Google's Material Design guidelines, enhancing usability and consistency across Android apps."
                ],
              ),
            ],
          ),
          Technologies(
            name: 'Flutter Development',
            startDate: DateTime(2022, DateTime.january),
            cover: SvgPicture.asset(
              "flutter.svg",
              height: 300,
              width: 300,
            ),
            brief:
                "I am a seasoned Flutter developer with a solid 3-year track record in the field. My expertise lies in leveraging Flutter's capabilities to ensure code reusability and deliver cross-platform functionality. By adhering to best practices and architectural patterns, I prioritize the development of maintainable and scalable applications. Additionally, I am dedicated to maintaining consistent frames per second (fps) across various devices, ensuring optimal performance and user experience. With a keen eye for detail and a passion for crafting high-quality software, I strive to push the boundaries of Flutter development and create polished, user-centric applications.",
            url: 'https://flutter.dev',
            abilities: const [
              Ability(
                name: 'Library Creation',
                brief:
                    'Proficient in developing reusable code libraries in Flutter, promoting code efficiency and maintainability through modularization',
              ),
              Ability(
                name: 'Modularization',
                brief:
                    'Expertise in modularizing Flutter applications to separate concerns, enhancing productivity and scalability by isolating and managing distinct app components',
              ),
              Ability(
                name: 'State Management',
                brief:
                    'Skilled in implementing effective state management solutions in Flutter applications, employing appropriate tools and patterns to maintain clean and efficient codebases.',
              ),
              Ability(
                name: 'Background Tasks',
                brief:
                    'Adept at executing background tasks in different isolates within Flutter apps, ensuring smooth performance and responsiveness while handling concurrent operations',
              ),
              Ability(
                name: 'Multi-platform Development',
                brief:
                    'Experienced in building versatile applications across desktop, mobile, and web platforms using Flutter, incorporating essential functionality to meet diverse user needs and device capabilities',
              ),
            ],
          ),
        ],
      ),
      SkillBoard(
        name: 'Vector Graphics',
        color: Colors.brown,
        brief:
            'Proficient in creating vector graphics using Adobe Illustrator and animating them seamlessly using Rive, enhancing visual appeal and interactivity in digital designs.',
        technologies: [
          Technologies(
            name: 'Rive',
            brief:
                "Rive is a powerful design and animation tool used for creating interactive vector animations and illustrations for various digital platforms.",
            startDate: DateTime(2022, DateTime.march),
            cover: Image.asset(
              "rive.png",
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
          ),
          Technologies(
            name: 'Adobe illustrator',
            brief:
                "Adobe Illustrator is a versatile vector graphics editor used for creating scalable illustrations, logos, icons, and other graphical elements for print, web, and multimedia projects.",
            startDate: DateTime(2022, DateTime.march),
            cover: SvgPicture.asset("adobe-illustrator.svg"),
            url: 'https://www.adobe.com/products/illustrator.html',
            abilities: const [
              Ability(
                name: 'Character modelling',
                brief:
                    "Proficient in character drawing using Adobe Illustrator, leveraging its powerful vector-based tools to create detailed and expressive characters for various digital media and design projects.",
              ),
            ],
          ),
        ],
      ),
      SkillBoard(
        name: 'Database administrations',
        color: Colors.deepOrangeAccent,
        brief:
            "Proficient in database administration, encompassing tasks such as database installation, configuration, performance tuning, backup and recovery, security management, and troubleshooting, ensuring optimal functionality, reliability, and security of database systems.",
        technologies: [
          Technologies(
            name: 'PostgreSQL',
            brief:
                "PostgreSQL is a powerful open-source relational database management system known for its robustness, extensibility, and adherence to SQL standards, offering advanced features for data storage, retrieval, and management in various applications.",
            startDate: DateTime(2021, DateTime.august),
            cover: SvgPicture.asset("postgresql.svg"),
            url: 'https://www.postgresql.org',
            abilities: const [
              Ability(
                name: 'Roles and User Management',
                brief:
                    "Proficient in PostgreSQL's role-based access control system, managing users, groups, and permissions to ensure secure data access and manipulation.",
              ),
              Ability(
                name: 'Extension Integration',
                brief:
                    "Expertise in extending PostgreSQL functionality by integrating and configuring extensions, such as hashing functions, to enhance database capabilities.",
              ),
              Ability(
                name: 'Replication Setup',
                brief:
                    "Skilled in setting up and configuring replication in PostgreSQL, enabling data redundancy and high availability for mission-critical applications.",
              ),
              Ability(
                name: 'Indexing',
                brief:
                    'Adept at implementing indexing strategies in PostgreSQL to optimize query performance and accelerate data retrieval operations',
              ),
              Ability(
                name: 'Constraints Implementation',
                brief:
                    'Experienced in enforcing data integrity through the implementation of constraints in PostgreSQL, ensuring that data adheres to specified rules and requirements',
              ),
              Ability(
                name: 'Check Constraints',
                brief:
                    'Proficient in utilizing check constraints in PostgreSQL to enforce specific conditions on data values, ensuring data consistency and validity within the database',
              ),
              Ability(
                name: 'Sharding',
                brief:
                    'Skilled in configuring and managing data sharing mechanisms within PostgreSQL databases, facilitating collaboration and data accessibility across teams or applications.',
              ),
            ],
          ),
          Technologies(
            name: 'MySQL',
            brief:
                "MySQL is a widely-used open-source relational database management system known for its reliability, performance, and ease of use, offering robust features for data storage, retrieval, and management in various applications.",
            startDate: DateTime(2018, DateTime.may),
            cover: SvgPicture.asset("mysql.svg"),
            url: 'https://www.mysql.com',
          ),
          Technologies(
            name: 'MongoDB',
            brief:
                "MongoDB is a popular NoSQL database solution known for its flexibility, scalability, and high performance, offering document-oriented storage and flexible data models suitable for modern application development.",
            startDate: DateTime(2021, DateTime.august),
            cover: SvgPicture.asset(
              "mongo.svg",
              height: 300,
              width: 300,
            ),
            url: 'https://www.mongodb.com',
          ),
        ],
      ),
      SkillBoard(
        name: 'UML visualization',
        color: Colors.white,
        brief:
            "Proficient in UML (Unified Modeling Language) visualization, utilizing industry-standard diagrams and notations to depict system architectures, design patterns, and software processes, facilitating clear communication and collaboration among project stakeholders.",
        technologies: [
          Technologies(
            name: 'Visual Paradigm',
            brief:
                "Visual Paradigm is a comprehensive modeling tool used for visualizing, designing, and documenting software systems and business processes, offering a wide range of UML diagrams, agile tools, and collaboration features.",
            startDate: DateTime(
              2020,
              DateTime.january,
            ),
            cover: Image.asset("visual-paradigm.png"),
            url: 'https://www.visual-paradigm.com',
            abilities: const [
              Ability(
                name: 'Activity Diagrams',
                brief:
                    "Proficient in activity diagrams, a type of UML diagram used to model workflows and business processes, facilitating clear visualization and analysis of system behaviors and interactions.",
                url:
                    'https://www.visual-paradigm.com/tutorials/how-to-draw-activity-diagram-in-uml',
              ),
              Ability(
                name: 'Data Flow Diagram',
                brief:
                    "Skilled in data flow diagrams (DFDs), a visual representation technique used to illustrate the flow of data within a system, aiding in the analysis, design, and understanding of information processes and relationships.",
                url:
                    'https://www.visual-paradigm.com/tutorials/data-flow-diagram-dfd.jsp',
              ),
              Ability(
                name: 'Entity Relationship Diagram',
                brief:
                    "Proficient in Entity-Relationship Diagrams (ERDs), a modeling technique used to visually represent the structure of a database, depicting entities, their attributes, and relationships, facilitating database design and analysis.",
                url:
                    'https://www.visual-paradigm.com/tutorials/databasedesign.jsp',
              ),
            ],
          ),
        ],
      ),
    ];

enum InfoLevel {
  low(level: 1, icon: Icons.directions_walk),
  mid(level: 2, icon: Icons.motorcycle),
  high(level: 3, icon: Icons.airplanemode_active);

  final int level;
  final IconData icon;

  const InfoLevel({required this.level, required this.icon});
}

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

class SkillsPage extends StatelessWidget {
  SkillsPage({
    required this.goToSkillPlayground,
    super.key,
  });

  final Function() goToSkillPlayground;
  final ValueNotifier<Technologies?> selectedTech = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Skills",
          style: GoogleFonts.poppins(
            fontSize: 60,
          ),
        ),
        IconButton(
          onPressed: goToSkillPlayground,
          icon: Icon(Icons.ads_click),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder(
            valueListenable: selectedTech,
            builder: (_, tech, __) {
              return GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 150,
                  mainAxisSpacing: 80,
                ),
                children: skills
                    .expand(
                      (s) => s.technologies
                          .map(
                            (t) => GestureDetector(
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: t.cover,
                                    ),
                                  ),
                                  Text(t.name),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
