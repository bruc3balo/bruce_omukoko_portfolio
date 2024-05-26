import 'dart:async';
import 'dart:math';

import 'package:bruce_omukoko_portfolio/data/data.dart';
import 'package:bruce_omukoko_portfolio/main.dart';
import 'package:bruce_omukoko_portfolio/pages/skills_playground.dart';
import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

enum InfoLevel {
  low(level: 1, icon: Icons.directions_walk),
  mid(level: 2, icon: Icons.motorcycle),
  high(level: 3, icon: Icons.airplanemode_active);

  final int level;
  final IconData icon;

  const InfoLevel({required this.level, required this.icon});
}

class SkillsPage extends StatefulWidget {
  const SkillsPage({
    required this.goToSkillPlayground,
    super.key,
  });

  final Function() goToSkillPlayground;

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final ValueNotifier<Technologies?> selectedTech = ValueNotifier(null);

  final ValueNotifier<double> colorStream = ValueNotifier(1);

  bool reverse = false;

  @override
  void initState() {
    Timer.periodic(
      const Duration(milliseconds: 200),
      (timer) {
        double val = colorStream.value;

        if (val <= 0.1) {
          reverse = false;
        } else if (val >= 0.9) {
          reverse = true;
        }

        if (reverse) {
          val -= 0.1;
        } else {
          val += 0.1;
        }

        colorStream.value = val;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return LayoutBuilder(builder: (_, size) {
      bool isMobileView = size.maxWidth < mobileSizeBorder;
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: SizedBox(
              height: 500,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Skills",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 60,
                              color: orange,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: widget.goToSkillPlayground,
                            icon: ValueListenableBuilder(
                              valueListenable: colorStream,
                              builder: (_, opacity, __) {
                                return AnimatedOpacity(
                                  opacity: opacity,
                                  duration: const Duration(milliseconds: 200),
                                  child: const Icon(
                                    Icons.ads_click,
                                    color: Colors.greenAccent,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: isMobileView ? 200 : 350,
                    bottom: 250,
                    child: PsstPressHere(
                      isMobileView: isMobileView,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder(
              valueListenable: selectedTech,
              builder: (_, tech, __) {
                return GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 150,
                    mainAxisSpacing: 80,
                  ),
                  children: skills
                      .expand(
                        (s) => s.technologies
                            .map(
                              (t) => OnHover(
                                builder: (hovering) {
                                  return Flex(
                                    direction: Axis.vertical,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => showTechnologyInfo(
                                            context: context,
                                            skillBoard: s,
                                            technologies: t,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                              hovering ? 8.0 : 20.0,
                                            ),
                                            child: Visibility(
                                              visible: hovering,
                                              replacement: t.cover,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: t.cover,
                                                  ),
                                                  SvgPicture.asset(
                                                    "assets/skills_hover.svg",
                                                    width: 250,
                                                    height: 250,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        t.name,
                                        style: GoogleFonts.aBeeZee(),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        t.xp,
                                        style: GoogleFonts.aBeeZee(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                            .toList(),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

class PsstPressHere extends StatelessWidget {
  const PsstPressHere({
    required this.isMobileView,
    super.key,
  });

  final bool isMobileView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, size) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Psst press here",
            style: GoogleFonts.lovedByTheKing(
              color: Colors.white,
              fontSize: isMobileView ? 34 : 64,
            ),
            textAlign: TextAlign.center,
          ),
          SvgPicture.asset(
            "assets/skills_arrow.svg",
          ),
        ],
      );
    });
  }
}
