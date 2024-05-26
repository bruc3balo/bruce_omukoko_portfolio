import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

ValueNotifier<bool> splashNotifier = ValueNotifier(true);

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: splashNotifier,
      builder: (_, showing, __) {
        return Visibility(
          visible: showing,
          maintainSemantics: false,
          maintainInteractivity: false,
          maintainAnimation: false,
          maintainState: false,
          maintainSize: false,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Scaffold(
              backgroundColor: darkBackground,
              body: GestureDetector(
                onTap: () => splashNotifier.value = false,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Bruce",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: orange,
                                ),
                              ),
                              TextSpan(
                                text: " Omukoko",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets/mouse.svg",
                                color: orange,
                                width: 80,
                                height: 80,
                              ),
                            ),

                            Text(
                              'Tap to continue',
                              style: GoogleFonts.inter(
                                fontSize: 35,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
