import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Project {
  final Widget cover;
  final String name;
  final String about;
  final String url;

  const Project({
    required this.cover,
    required this.name,
    required this.about,
    required this.url,
  });
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  List<Project> get projects => [
        Project(
          name: 'Truth or Drink',
          about:
              "Truth or Drink is a drinking game where players take turns asking each other questions. If someone doesn't want to answer, they take a drink instead. It's a fun way to get to know each other better while enjoying some drinks.",
          url: 'https://truthordrink-44d9a.web.app',
          cover: RiveAnimation.asset(
            "assets/tod.riv",
            // controllers: [
            //   OneShotAnimation(
            //     p.animation,
            //     autoplay: true,
            //   )
            // ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: projects.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          mainAxisExtent: 330,
        ),
        itemBuilder: (_, i) {
          Project p = projects[i];
          return ProjectItem(project: p);
        },
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: SizedBox(
                child: project.cover,
              ),
            ),
            ListTile(
              title: Text(project.name),
              subtitle: Text(project.about),
            ),
            ElevatedButton(
              onPressed: () => openStringUri(project.url),
              child: const Text("View"),
            ),
          ],
        ),
      ),
    );
  }
}
