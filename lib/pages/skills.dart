import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:flutter/material.dart';

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
  final DateTime startDate;
  final List<Ability> abilities;

  const Technologies({
    required this.name,
    required this.brief,
    required this.startDate,
    required this.url,
    this.abilities = const [],
  });
}

class SkillBoard {
  final String name;
  final String brief;
  final List<Technologies> technologies;

  const SkillBoard({
    required this.name,
    required this.brief,
    this.technologies = const [],
  });
}

class Skills extends StatelessWidget {
  const Skills({super.key});

  List<SkillBoard> get skills => [
        SkillBoard(
          name: 'Backend Development',
          brief:
              'As a seasoned backend developer, I specialize in crafting robust architectures and optimizing performance to ensure seamless operation of backend systems. With a keen focus on security, I implement stringent measures to safeguard sensitive data and protect against potential threats. My expertise lies in architecting scalable solutions that deliver high performance and reliability, while prioritizing the integrity and confidentiality of backend systems. I am committed to staying abreast of the latest advancements in backend technologies to continuously enhance system efficiency and resilience.',
          technologies: [
            Technologies(
              name: 'Spring Framework',
              brief:
                  'Spring is a powerful and versatile backend framework for Java development, renowned for its maturity, extensive community support, and focus on security. With its comprehensive suite of features and modules, Spring empowers developers to build scalable, reliable, and secure applications for a wide range of use cases, from simple microservices to complex enterprise systems.',
              url: 'https://spring.io/projects/spring-framework',
              startDate: DateTime(2021, DateTime.august),
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
          brief:
              'As a dedicated DevOps engineer, I specialize in ensuring high availability, stability, and seamless operations of complex environments. With a relentless focus on eliminating downtime, I implement robust strategies and automation techniques to maintain uninterrupted service delivery. My expertise extends to orchestrating secure networking communications between all nodes, implementing encryption protocols, and enforcing stringent access controls to safeguard sensitive data. Through continuous monitoring, optimization, and automation, I strive to create resilient infrastructures that meet the highest standards of reliability and security',
          technologies: [
            Technologies(
              name: 'Docker',
              brief:
                  'I have 2 years of experience with docker containerization',
              url: 'https://www.docker.com',
              startDate: DateTime(2022, DateTime.august),
              abilities: [
                Ability(
                  name: 'Application containerization',
                  brief:
                      'Containerizing applications to maintain a stable environment',
                )
              ],
            ),
            Technologies(
              name: 'Kubernetes',
              brief:
                  'I have 1 year of experience with kubernetes container orchestration',
              url: 'https://kubernetes.io',
              startDate: DateTime(2024, DateTime.february),
              abilities: [
                Ability(
                  name: 'Application Deployment',
                  brief: 'Deploying services and pods',
                )
              ],
            )
          ],
        ),
        SkillBoard(
          name: 'Mobile Development',
          brief: "Mobile dev",
          technologies: [
            Technologies(
              name: 'Native Android',
              brief:
                  'I am a seasoned Android developer with over 5 years of industry experience, proficient in Java and XML layout. My primary focus lies in implementing robust and scalable mobile applications using the MVVM (Model-View-ViewModel) architecture pattern. By leveraging MVVM, I ensure clean separation of concerns, maintainability, and testability of codebases. I possess a deep understanding of Android lifecycle, UI/UX design principles, and performance optimization techniques. With a proven track record of delivering high-quality apps, I am committed to staying updated with the latest advancements in Android development to create cutting-edge solutions that meet the evolving needs of users.',
              url: 'https://developer.android.com',
              startDate: DateTime(2020, DateTime.may),
              abilities: [
                Ability(
                  name: 'Java Logic Programming',
                  brief: 'Logic with java',
                  url: 'https://www.java.com/en/download/help/whatis_java.html',
                ),
                Ability(
                  name: 'XML Layouts',
                  brief: 'Creating layouts with xml',
                  url:
                      'https://developer.android.com/develop/ui/views/layout/declaring-layout',
                ),
              ],
            ),
            Technologies(
              name: 'Flutter Development',
              startDate: DateTime(2022, DateTime.january),
              brief:
                  "I am a seasoned Flutter developer with a solid 3-year track record in the field. My expertise lies in leveraging Flutter's capabilities to ensure code reusability and deliver cross-platform functionality. By adhering to best practices and architectural patterns, I prioritize the development of maintainable and scalable applications. Additionally, I am dedicated to maintaining consistent frames per second (fps) across various devices, ensuring optimal performance and user experience. With a keen eye for detail and a passion for crafting high-quality software, I strive to push the boundaries of Flutter development and create polished, user-centric applications.",
              url: 'https://flutter.dev',
            ),
          ],
        ),
        SkillBoard(
          name: 'Vector Graphics',
          brief: 'todo',
        ),
        SkillBoard(
          name: 'Database administrations',
          brief: 'todo',
        ),
        SkillBoard(
          name: 'Model Visualization',
          brief: 'todo',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skills"),
      ),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (_, i) {
          SkillBoard board = skills[i];
          return ExpansionTile(
            title: Text(board.name),
            subtitle: Text(board.brief),
            children: board.technologies.map(
              (t) {
                var xp = DateTime.now().difference(t.startDate);

                return ExpansionTile(
                  title: Text(t.name),
                  subtitle: Text(t.brief),
                  trailing: Text(
                    experience(xp),
                  ),
                  children: t.abilities
                      .map(
                        (a) => ExpansionTile(
                          title: Text(a.name),
                          subtitle: Text(a.brief),
                          children: a.points
                              .map(
                                (p) => ListTile(
                                  leading: const Icon(Icons.arrow_forward),
                                  title: Text(p),
                                ),
                              )
                              .toList(),
                        ),
                      )
                      .toList(),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
