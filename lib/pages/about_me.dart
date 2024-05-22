import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:bruce_omukoko_portfolio/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({
    required this.goToResume,
    required this.scrollDown,
    super.key,
  });

  final Function() goToResume;
  final Function() scrollDown;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset("flash.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Hey There, I'm ",
                          style: GoogleFonts.inter(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "Bruce",
                          style: GoogleFonts.inter(
                            fontSize: 50,
                            color: orange,
                          ),
                        ),
                        TextSpan(
                          text: " Omukoko",
                          style: GoogleFonts.inter(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: SvgPicture.asset("sign.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "Software developer, chilling out in Nairobi and always up for a good problem solving challenge one code at a time.",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset("smile.svg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                                const EdgeInsets.all(15.0)),
                            backgroundColor: WidgetStateProperty.resolveWith(
                              (state) {
                                if (state.contains(WidgetState.hovered)) {
                                  return Colors.transparent;
                                }

                                return orange;
                              },
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                            side: WidgetStateProperty.resolveWith(
                              (state) {
                                if (state.contains(WidgetState.hovered)) {
                                  return BorderSide(color: orange, width: 1.0);
                                }

                                return null;
                              },
                            ),
                          ),
                          child: Text(
                            "Let's Work",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                                const EdgeInsets.all(15.0)),
                            backgroundColor: WidgetStateProperty.all(
                              Colors.transparent,
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                            side: WidgetStateProperty.resolveWith(
                              (state) {
                                if (state.contains(WidgetState.hovered)) {
                                  return BorderSide(
                                    color: orange,
                                    width: 1.0,
                                  );
                                }

                                return BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                );
                              },
                            ),
                          ),
                          child: Text(
                            "Get to know more",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: OnHover(
                        builder: (hovering) {
                          return GestureDetector(
                            onTap: scrollDown,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    "mouse.svg",
                                    color: hovering ? orange : Colors.white,
                                  ),
                                ),
                                Text(
                                  "Scroll down",
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: hovering ? orange : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          "assets/brucy.png",
        ),
      ],
    );
  }
}
