import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bruce_omukoko_portfolio/pages/contact_me.dart';
import 'package:bruce_omukoko_portfolio/pages/projects.dart';
import 'package:bruce_omukoko_portfolio/pages/publications.dart';
import 'package:bruce_omukoko_portfolio/pages/resume.dart';
import 'package:bruce_omukoko_portfolio/pages/skill_playground.dart';
import 'package:bruce_omukoko_portfolio/pages/skills.dart';
import 'package:bruce_omukoko_portfolio/pages/splash_screen.dart';
import 'package:bruce_omukoko_portfolio/utils/reusable_widgets.dart';
import 'package:bruce_omukoko_portfolio/utils/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'about_me.dart';

ValueNotifier<SingleHomePages> _homeMenu = ValueNotifier(
  SingleHomePages.core,
);

ValueNotifier<Set<HomeSection>> _visiblePages = ValueNotifier({});

final ScrollController scrollController = ScrollController();
final aboutMeKey = GlobalKey();
final skillsKey = GlobalKey();
final publicationsKey = GlobalKey();
final projectsKey = GlobalKey();
final contactMeKey = GlobalKey();

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
  projects("Projects"),
  contact("Contact");

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
            title: const Text(bruce),
            actions: HomeSection.values
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      GlobalKey key = switch (e) {
                        HomeSection.about => aboutMeKey,
                        HomeSection.publications => publicationsKey,
                        HomeSection.skills => skillsKey,
                        HomeSection.projects => projectsKey,
                        HomeSection.contact => contactMeKey,
                      };

                      Scrollable.ensureVisible(
                        key.currentContext!,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.slowMiddle,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: OnHover(builder: (hovering) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              e.value,
                              minFontSize: 12,
                              maxFontSize: 16,
                              style: GoogleFonts.abel(
                                  color: hovering ? Colors.cyan : Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            ValueListenableBuilder(
                                valueListenable: _visiblePages,
                                builder: (_, pages, __) {
                                  bool visible = pages.contains(e);
                                  return AnimatedOpacity(
                                    opacity: visible ? 1 : 0,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.slowMiddle,
                                    child: Visibility(
                                      visible: visible,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 3.5,
                                          backgroundColor: Colors.cyan,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }),
                    ),
                  ),
                )
                .toList(),
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

  double get separation => 200;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VisibilityDetector(
            key: aboutMeKey,
            onVisibilityChanged: (info) {
              bool isVisible = info.visibleFraction > 0;
              if (isVisible) {
                _visiblePages.value =
                    Set.from(_visiblePages.value..add(HomeSection.about));
              } else {
                _visiblePages.value =
                    Set.from(_visiblePages.value..remove(HomeSection.about));
              }
            },
            child: const AboutMePage(),
          ),
          SizedBox(
            height: separation,
          ),
          VisibilityDetector(
            key: publicationsKey,
            onVisibilityChanged: (info) {
              bool isVisible = info.visibleFraction > 0;
              if (isVisible) {
                _visiblePages.value = Set.from(
                    _visiblePages.value..add(HomeSection.publications));
              } else {
                _visiblePages.value = Set.from(
                    _visiblePages.value..remove(HomeSection.publications));
              }
            },
            child: const PublicationsPage(),
          ),
          SizedBox(
            height: separation,
          ),
          VisibilityDetector(
            key: skillsKey,
            onVisibilityChanged: (info) {
              bool isVisible = info.visibleFraction > 0;
              if (isVisible) {
                _visiblePages.value =
                    Set.from(_visiblePages.value..add(HomeSection.skills));
              } else {
                _visiblePages.value =
                    Set.from(_visiblePages.value..remove(HomeSection.skills));
              }
            },
            child: SkillsPage(
              goToSkillPlayground: goToSkillPlayground,
            ),
          ),
          SizedBox(
            height: separation,
          ),
          VisibilityDetector(
            key: projectsKey,
            onVisibilityChanged: (info) {
              bool isVisible = info.visibleFraction > 0;
              if (isVisible) {
                _visiblePages.value =
                    Set.from(_visiblePages.value..add(HomeSection.projects));
              } else {
                _visiblePages.value =
                    Set.from(_visiblePages.value..remove(HomeSection.projects));
              }
            },
            child: const ProjectsPage(),
          ),
          SizedBox(
            height: separation,
          ),
          VisibilityDetector(
            key: contactMeKey,
            onVisibilityChanged: (info) {
              bool isVisible = info.visibleFraction > 0;
              if (isVisible) {
                _visiblePages.value = Set.from(
                  _visiblePages.value..add(HomeSection.contact),
                );
              } else {
                _visiblePages.value = Set.from(
                  _visiblePages.value..remove(HomeSection.contact),
                );
              }
            },
            child: ContactMePage(),
          ),
          SizedBox(
            height: separation / 2,
          ),
        ],
      ),
    );
  }
}
