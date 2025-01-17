import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bruce_omukoko_portfolio/data/data.dart';
import 'package:bruce_omukoko_portfolio/pages/contact_me.dart';
import 'package:bruce_omukoko_portfolio/pages/projects.dart';
import 'package:bruce_omukoko_portfolio/pages/publications.dart';
import 'package:bruce_omukoko_portfolio/pages/skills_playground.dart';
import 'package:bruce_omukoko_portfolio/pages/skills.dart';
import 'package:bruce_omukoko_portfolio/pages/splash_screen.dart';
import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'about_me.dart';

final ValueNotifier<SingleHomePages> _homeMenu = ValueNotifier(
  SingleHomePages.core,
);
final List<HomeSection> sections = HomeSection.values.toList();
final ValueNotifier<HomeSection> _visiblePages = ValueNotifier(HomeSection.about);
final ScrollController scrollController = ScrollController();
final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

enum SingleHomePages {
  core("core"),
  skillPlayground("Skill playground");

  final String value;

  const SingleHomePages(this.value);
}

enum HomeSection {
  about("About"),
  skills("Skills"),
  publications("Publications"),
  // projects("Projects"),
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
          "assets/background.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        LayoutBuilder(
          builder: (_, size) {
            bool isMobileView = size.maxWidth < mobileSizeBorder;
            return ValueListenableBuilder(
              valueListenable: _homeMenu,
              builder: (_, selectedItem, __) {
                return Scaffold(
                  drawer: isMobileView
                      ? Drawer(
                          backgroundColor: darkBackground,
                          child: ListView.builder(
                            itemCount: sections.length,
                            itemBuilder: (_, i) {
                              var e = sections[i];
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    itemScrollController.scrollTo(
                                      index: e.index,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeInOutCubic,
                                    );

                                    Navigator.pop(context);
                                  },
                                  child: ValueListenableBuilder(
                                    valueListenable: _visiblePages,
                                    builder: (_, pages, __) {
                                      bool visible = pages == e;
                                      return OnHover(
                                        builder: (hovering) {
                                          return ListTile(
                                            tileColor: visible
                                                ? orange
                                                : Colors.transparent,
                                            selected: visible,
                                            leading: AnimatedOpacity(
                                              opacity: visible ? 1 : 0,
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.slowMiddle,
                                              child: Visibility(
                                                visible: visible,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: CircleAvatar(
                                                    radius: 3.5,
                                                    backgroundColor: orange,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            title: AutoSizeText(
                                              e.value,
                                              minFontSize: 8,
                                              maxFontSize: 16,
                                              style: GoogleFonts.inter(
                                                color: hovering
                                                    ? orange
                                                    : Colors.white,
                                                fontWeight: visible
                                                    ? FontWeight.bold
                                                    : FontWeight.w400,
                                                // fontSize: 24,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : null,
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
                        .sublist(0, isMobileView ? 0 : sections.length)
                        .map(
                          (e) => MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                itemScrollController.scrollTo(
                                  index: e.index,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOutCubic,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 3.0,
                                  bottom: 3.0,
                                  left: isMobileView ? 2.0 : 6.0,
                                  right: isMobileView ? 2.0 : 6.0,
                                ),
                                child: ValueListenableBuilder(
                                  valueListenable: _visiblePages,
                                  builder: (_, pages, __) {
                                    bool visible = pages == e;
                                    return OnHover(
                                      builder: (hovering) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AutoSizeText(
                                              e.value,
                                              minFontSize: 8,
                                              maxFontSize: 16,
                                              style: GoogleFonts.inter(
                                                color: hovering
                                                    ? orange
                                                    : Colors.white,
                                                fontWeight: visible
                                                    ? FontWeight.bold
                                                    : FontWeight.w400,
                                                // fontSize: 24,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            AnimatedOpacity(
                                              opacity: visible ? 1 : 0,
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.slowMiddle,
                                              child: Visibility(
                                                visible: visible,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: CircleAvatar(
                                                    radius: 3.5,
                                                    backgroundColor: orange,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
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
                      SingleHomePages.core => CorePage(
                          goToSkillPlayground: () =>
                              _homeMenu.value = SingleHomePages.skillPlayground,
                        ),
                      SingleHomePages.skillPlayground => SkillPlayground(
                          goToCore: () =>
                              _homeMenu.value = SingleHomePages.core,
                        ),
                    },
                  ),
                );
              },
            );
          },
        ),
        const SplashScreen(),
      ],
    );
  }
}

class CorePage extends StatefulWidget {
  const CorePage({
    required this.goToSkillPlayground,
    super.key,
  });

  final Function() goToSkillPlayground;

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  double get separation => 200;

  @override
  void initState() {
    itemPositionsListener.itemPositions.addListener(() {
      List<ItemPosition> positions = itemPositionsListener
          .itemPositions
          .value
          .toList();

      positions.sort((a, b) => -a.index.compareTo(b.index));

      HomeSection section = sections[positions.first.index];

      // Set<HomeSection> visiblePages = itemPositionsListener.itemPositions.value
      //     .map((e) => sections[e.index])
      //     .toSet();
      _visiblePages.value = section;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
      itemCount: sections.length,
      separatorBuilder: (_, i) {
        //bool first = sections.first == sections[i];
        bool last = sections.last == sections[i];

        return SizedBox(
          height: last ? separation / 2 : separation,
        );
      },
      itemBuilder: (_, i) {
        HomeSection s = sections[i];
        return switch (s) {
          HomeSection.about => AboutMePage(
              goToResume: () {
                openStringUri(resumeFileUri);
              },
              scrollToSkills: () {
                itemScrollController.scrollTo(
                  index: HomeSection.skills.index,
                  duration: const Duration(seconds: 1),
                );
              },
              scrollToContactMe: () {
                itemScrollController.scrollTo(
                  index: HomeSection.contact.index,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
          HomeSection.publications => const PublicationsPage(),
          HomeSection.skills => SkillsPage(
              goToSkillPlayground: widget.goToSkillPlayground,
            ),
          // HomeSection.projects => const ProjectsPage(),
          HomeSection.contact => const ContactMePage(),
        };
      },
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
    );
  }
}
