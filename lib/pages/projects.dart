import 'package:bruce_omukoko_portfolio/data/data.dart';
import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  List<Project> get projects => [
        Project(
          name: 'Truth or Drink',
          about:
              "Truth or Drink is a drinking game where players take turns asking each other questions. If someone doesn't want to answer, they take a drink instead. It's a fun way to get to know each other better while enjoying some drinks.",
          url: 'https://truthordrink-kg.web.app',
          cover: const RiveAnimation.asset(
            "assets/tod.riv",
          ),
          stack: [
            springTechnology,
            flutterTechnology,
            mongoDbTechnology,
            riveTechnology,
            kubernetesTechnology,
            dockerTechnology,
            visualParadigmTechnology,
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Projects",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 60,
              color: orange,
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: projects
              .map(
                (e) => ProjectItem(
                  project: e,
                ),
              ).toList(),
        ),
      ],
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
    // ThemeData theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => openStringUri(project.url),
        child: SizedBox(
          height: 500,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(child: project.cover),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SelectableText(
                            project.name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.open_in_new,
                        ),
                      ),
                      subtitle: SelectableText(
                        project.about,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 70,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: project.stack
                              .map(
                                (e) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () => openStringUri(e.url),
                                      child: Tooltip(
                                        message: e.name,
                                        child: e.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
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
