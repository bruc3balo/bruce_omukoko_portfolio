import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bruce_omukoko_portfolio/pages/contact_me.dart';
import 'package:bruce_omukoko_portfolio/pages/projects.dart';
import 'package:bruce_omukoko_portfolio/pages/publications.dart';
import 'package:bruce_omukoko_portfolio/pages/resume.dart';
import 'package:bruce_omukoko_portfolio/pages/skills_playground.dart';
import 'package:bruce_omukoko_portfolio/pages/skills.dart';
import 'package:bruce_omukoko_portfolio/pages/splash_screen.dart';
import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:bruce_omukoko_portfolio/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'about_me.dart';

final ValueNotifier<SingleHomePages> _homeMenu = ValueNotifier(
  SingleHomePages.core,
);
final List<HomeSection> sections = HomeSection.values.sublist(0, 1).toList();
final ValueNotifier<Set<HomeSection>> _visiblePages = ValueNotifier({});

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
  skills("Skills"),
  publications("Publications"),
  projects("Projects"),
  contact("Contact");

  final String value;

  const HomeSection(this.value);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "background.png",
          fit: BoxFit.fill,
        ),
        ValueListenableBuilder(
          valueListenable: _homeMenu,
          builder: (_, selectedItem, __) {
            return Scaffold(
              appBar: AppBar(
                title: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Bruce",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: orange,
                        ),
                      ),
                      TextSpan(
                        text: " Omukoko",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: sections
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
                          padding: const EdgeInsets.only(
                            top: 3.0,
                            bottom: 3.0,
                            left: 6.0,
                            right: 6.0,
                          ),
                          child: OnHover(
                            builder: (hovering) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AutoSizeText(
                                    e.value,
                                    minFontSize: 12,
                                    maxFontSize: 16,
                                    style: GoogleFonts.inter(
                                      color: hovering ? orange : Colors.white,
                                      fontSize: 24,
                                    ),
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
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 3.5,
                                              backgroundColor: orange,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
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
                    fillColor: Colors.transparent,
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
                      goToResume: () =>
                          _homeMenu.value = SingleHomePages.resume,
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
        ),
      ],
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
    return ListView.separated(
      itemCount: sections.length,
      separatorBuilder: (_, i) {

        bool first = sections.first == sections[i];
        bool last = sections.last == sections[i];

        return SizedBox(
          height: last ? separation / 2 : separation,
        );

      },
      itemBuilder: (_, i) {
        HomeSection s = sections[i];
        return switch (s) {
          HomeSection.about => VisibilityDetector(
              key: aboutMeKey,
              onVisibilityChanged: (info) {
                bool isVisible = info.visibleFraction > 0;
                if (isVisible) {
                  _visiblePages.value = Set.from(
                    _visiblePages.value..add(HomeSection.about),
                  );
                } else {
                  _visiblePages.value = Set.from(
                    _visiblePages.value..remove(HomeSection.about),
                  );
                }
              },
              child: AboutMePage(
                goToResume: goToResume,
                scrollDown: () {
                  Scrollable.ensureVisible(
                    skillsKey.currentContext!,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
          HomeSection.publications => VisibilityDetector(
              key: publicationsKey,
              onVisibilityChanged: (info) {
                bool isVisible = info.visibleFraction > 0;
                if (isVisible) {
                  _visiblePages.value = Set.from(
                    _visiblePages.value..add(HomeSection.publications),
                  );
                } else {
                  _visiblePages.value = Set.from(
                    _visiblePages.value..remove(HomeSection.publications),
                  );
                }
              },
              child: const PublicationsPage(),
            ),
          HomeSection.skills => VisibilityDetector(
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
          HomeSection.projects => VisibilityDetector(
              key: projectsKey,
              onVisibilityChanged: (info) {
                bool isVisible = info.visibleFraction > 0;
                if (isVisible) {
                  _visiblePages.value =
                      Set.from(_visiblePages.value..add(HomeSection.projects));
                } else {
                  _visiblePages.value = Set.from(
                      _visiblePages.value..remove(HomeSection.projects));
                }
              },
              child: const ProjectsPage(),
            ),
          HomeSection.contact => VisibilityDetector(
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
        };
      },
    );
  }
}
