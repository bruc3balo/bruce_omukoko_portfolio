import 'package:animations/animations.dart';
import 'package:bruce_omukoko_portfolio/pages/contact_me.dart';
import 'package:bruce_omukoko_portfolio/pages/projects.dart';
import 'package:bruce_omukoko_portfolio/pages/publications.dart';
import 'package:bruce_omukoko_portfolio/pages/skills.dart';
import 'package:bruce_omukoko_portfolio/routes/routes.dart';
import 'package:bruce_omukoko_portfolio/utils/variables.dart';
import 'package:flutter/material.dart';

import 'about_me.dart';

ValueNotifier<HomeMenu> _homeMenu = ValueNotifier(HomeMenu.about);

enum HomeMenu {
  about("About me"),
  publications("Publications"),
  skills("Skills"),
  projects("Projects");

  final String value;

  const HomeMenu(this.value);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<HomeMenu> pages = HomeMenu.values;

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: pages
                          .map(
                            (e) => TextButton(
                          onPressed: () => _homeMenu.value = e,
                          child: Text(e.value),
                        ),
                      ).toList(),
                    ),
                  ),
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
              HomeMenu.about => const AboutMePage(),
              HomeMenu.publications => const PublicationsPage(),
              HomeMenu.skills => const SkillsPage(),
              HomeMenu.projects => const ProjectsPage(),
            },
          ),
        );
      }
    );
  }
}
