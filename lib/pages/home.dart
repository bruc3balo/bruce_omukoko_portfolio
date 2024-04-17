import 'package:animations/animations.dart';
import 'package:bruce_omukoko_portfolio/main.dart';
import 'package:bruce_omukoko_portfolio/pages/contact_me.dart';
import 'package:bruce_omukoko_portfolio/pages/projects.dart';
import 'package:bruce_omukoko_portfolio/pages/publications.dart';
import 'package:bruce_omukoko_portfolio/pages/skills.dart';
import 'package:bruce_omukoko_portfolio/routes/routes.dart';
import 'package:bruce_omukoko_portfolio/utils/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about_me.dart';

ValueNotifier<HomeMenu> _homeMenu = ValueNotifier(HomeMenu.skills);

enum HomeMenu {
  about("About"),
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
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: pages
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: () => _homeMenu.value = e,
                                  style: selectedItem != e
                                      ? themeData.textButtonTheme.style
                                      : themeData.textButtonTheme.style?.copyWith(
                                          foregroundColor: MaterialStatePropertyAll(themeData.colorScheme.background),
                                          side: MaterialStatePropertyAll(BorderSide(color: themeData.colorScheme.onError, width: 2)),
                                        ),
                                  child: Text(e.value),
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
        });
  }
}
