import 'package:auto_size_text/auto_size_text.dart';
import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Project {
  final Widget cover;
  final String name;
  final String about;
  final String url;
  final List<String> stack;

  const Project({
    required this.cover,
    required this.name,
    required this.about,
    required this.url,
    this.stack = const [],
  });
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  List<Project> get projects => [
        Project(
            name: 'Truth or Drink',
            about:
                "Truth or Drink is a drinking game where players take turns asking each other questions. If someone doesn't want to answer, they take a drink instead. It's a fun way to get to know each other better while enjoying some drinks.",
            url: 'https://truthordrink-kg.web.app',
            cover: RiveAnimation.asset(
              "assets/tod.riv",
            ),
            stack: [
              "Spring",
              "Flutter",
              "MongoDB",
              "Rive",
            ]),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: projects.length,
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
    ThemeData theme = Theme.of(context);
    return Card(
      child: GestureDetector(
        onTap: () => openStringUri(project.url),
        child: SizedBox(
          height: 300,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                child: project.cover,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      project.name,
                      style: theme.listTileTheme.titleTextStyle,
                    ),
                    Text(
                      project.about,
                      style: theme.listTileTheme.subtitleTextStyle,
                    ),
                    Column(
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: project.stack
                              .map(
                                (e) => Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                            side: const BorderSide(
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      child: AutoSizeText(e),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
