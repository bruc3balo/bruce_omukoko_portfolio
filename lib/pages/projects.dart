import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rive/rive.dart';

class Project {
  final Widget cover;
  final String name;
  final String about;
  final String url;
  final List<Widget> stack;

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
            SvgPicture.asset(
              "spring.svg",
              fit: BoxFit.contain,
              color: HexColor("#77bc1f"),
              height: 40,
              width: 40,
            ),
            SvgPicture.asset(
              "flutter.svg",
              height: 40,
              width: 40,
            ),
            SvgPicture.asset(
              "mongo.svg",
              height: 40,
              width: 40,
            ),
            Image.asset(
              "assets/rive.png",
              fit: BoxFit.contain,
              width: 40,
              height: 40,
            ),
            SvgPicture.asset(
              "kubernets.svg",
              fit: BoxFit.contain,
              width: 40,
              height: 40,
            ),
            SvgPicture.asset(
              "docker.svg",
              fit: BoxFit.contain,
              width: 40,
              height: 40,
            ),
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Projects",
          style: GoogleFonts.poppins(
            fontSize: 60,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: projects.length,
          itemBuilder: (_, i) {
            Project p = projects[i];
            return ProjectItem(project: p);
          },
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
    ThemeData theme = Theme.of(context);
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
                          child: Text(project.name),
                        ),
                        trailing: const Icon(
                          Icons.open_in_new,
                        ),
                      ),
                      subtitle: Text(project.about),
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
                                    child: e,
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
