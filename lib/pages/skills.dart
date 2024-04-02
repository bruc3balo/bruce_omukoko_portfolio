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
                  "Docker simplifies application deployment by packaging them with their dependencies into portable containers, enabling consistent and efficient deployment across various environments.",
              url: 'https://www.docker.com',
              startDate: DateTime(2022, DateTime.august),
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
              abilities: [
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
