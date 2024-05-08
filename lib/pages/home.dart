import 'package:animations/animations.dart';
import 'package:bruce_omukoko_portfolio/pages/projects.dart';
import 'package:bruce_omukoko_portfolio/pages/publications.dart';
import 'package:bruce_omukoko_portfolio/pages/resume.dart';
import 'package:bruce_omukoko_portfolio/pages/skill_playground.dart';
import 'package:bruce_omukoko_portfolio/pages/skills.dart';
import 'package:bruce_omukoko_portfolio/pages/splash_screen.dart';
import 'package:bruce_omukoko_portfolio/utils/variables.dart';
import 'package:flutter/material.dart';

import 'about_me.dart';

ValueNotifier<SingleHomePages> _homeMenu = ValueNotifier(
  SingleHomePages.splash,
);

enum SingleHomePages {
  splash("splash"),
  core("core"),
  resume("Resume"),
  skillPlayground("Skill playground");

  final String value;

  const SingleHomePages(this.value);
}

enum HomeSection {
  about("About"),
  publications("Publications"),
  skills("Skills"),
  projects("Projects");

  final String value;

  const HomeSection(this.value);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<SingleHomePages> pages = SingleHomePages.values;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: _homeMenu,
      builder: (_, selectedItem, __) {
        return Scaffold(
          appBar: AppBar(
            title: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Flexible(
                  child: Text(bruce),
                ),
              ],
            ),
          ),
          body: PageTransitionSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (
              Widget child,
              Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation,
            ) {
              return SharedAxisTransition(
                fillColor: Theme.of(context).colorScheme.onBackground,
                transitionType: SharedAxisTransitionType.horizontal,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: switch (selectedItem) {
              SingleHomePages.splash => SplashScreen(
                  goToCore: () => _homeMenu.value = SingleHomePages.core,
                ),
              SingleHomePages.core => CorePage(
                  goToSkillPlayground: () =>
                      _homeMenu.value = SingleHomePages.skillPlayground,
                  goToResume: () => _homeMenu.value = SingleHomePages.resume,
                ),
              SingleHomePages.resume => ResumePage(
                  goToCore: () => _homeMenu.value = SingleHomePages.core,
                ),
              SingleHomePages.skillPlayground => SkillPlayground(
                  goToCore: () => _homeMenu.value = SingleHomePages.core,
                ),
            },
          ),
        );
      },
    );
  }
}

class CorePage extends StatelessWidget {
  const CorePage({
    required this.goToResume,
    required this.goToSkillPlayground,
    super.key,
  });

  final Function() goToResume;
  final Function() goToSkillPlayground;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AboutMePage(),
          SizedBox(
            height: 150,
          ),
          PublicationsPage(),
          SizedBox(
            height: 150,
          ),
          SkillsPage(
            goToSkillPlayground: goToSkillPlayground,
          ),
          SizedBox(
            height: 150,
          ),
          ProjectsPage(),
        ],
      ),
    );
  }
}
