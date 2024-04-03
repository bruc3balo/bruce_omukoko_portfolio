import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/web_view.dart';
import 'package:flutter/material.dart';

class Project {
  final String name;
  final String about;
  final String url;

  const Project({
    required this.name,
    required this.about,
    required this.url,
  });
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  final List<Project> projects = const [
    Project(
      name: 'Truth or Drink',
      about:
          "Truth or Drink is a drinking game where players take turns asking each other questions. If someone doesn't want to answer, they take a drink instead. It's a fun way to get to know each other better while enjoying some drinks.",
      url: 'https://truthordrink-44d9a.web.app',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (_, i) {
          Project p = projects[i];
          return ListTile(
            onTap: () => openStringUri(p.url),
            title: Text(p.name),
            subtitle: Text(p.about),
          );
        },
      ),
    );
  }
}
