import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;

enum PublicationType {
  pubDev("Pub Dev"),
  rive("Rive");

  final String value;

  const PublicationType(this.value);

  Widget get widget => switch (this) {
        PublicationType.pubDev => SvgPicture.asset("dart.svg"),
        PublicationType.rive => Image.asset("rive.jpeg"),
      };
}

class PubDevPackage {
  final String name;
  final String about;
  final String url;
  final String image;

  const PubDevPackage({
    required this.name,
    required this.about,
    required this.url,
    required this.image,
  });
}

class RiveArt {
  final String name;
  final String description;
  final String animation;
  final String asset;

  const RiveArt({
    required this.name,
    required this.description,
    required this.animation,
    required this.asset,
  });
}

class PublicationsPage extends StatelessWidget {
  const PublicationsPage({super.key});

  BoxConstraints get webViewConstraints => const BoxConstraints(
        maxHeight: 600,
        minHeight: 300,
      );

  List<PublicationType> get publicationTypeList => PublicationType.values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Publications",
          style: GoogleFonts.poppins(
            fontSize: 60,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: publicationTypeList.length,
          itemBuilder: (_, i) {
            PublicationType p = publicationTypeList[i];
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    p.value,
                    textAlign: TextAlign.center,
                  ),
                ),
                subtitle: switch (p) {
                  PublicationType.pubDev => const PubDevPublications(),
                  PublicationType.rive => const RivePublications(),
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class PubDevPublications extends StatefulWidget {
  const PubDevPublications({super.key});

  @override
  State<PubDevPublications> createState() => _PubDevPublicationsState();
}

class _PubDevPublicationsState extends State<PubDevPublications> {
  List<PubDevPackage> get publications => const [
        PubDevPackage(
            name: "LRUMemoryCache",
            about:
                "A dart library used to cache data with an optional expiry date and callback functions",
            url: 'https://pub.dev/packages/lru_memory_cache',
            image: "lru_cache.png"),
        PubDevPackage(
            name: "Spinner Date Picker",
            about:
                "A minimally customizable flutter date picker library used to choose a date",
            url: 'https://pub.dev/packages/spinner_date_picker',
            image: "spinner.png"),
      ];

  Size get sectionSize => const Size(500, 500);

  final PageController controller = PageController();

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        bool isLastPage = (controller.page?.toInt() ?? 0) == publications.length - 1;
        if (isLastPage) {
          controller.animateToPage(
            0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInExpo,
          );
          return;
        }

        controller.nextPage(
          duration: const Duration(seconds: 1),
          curve: Curves.slowMiddle,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionSize.height,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        reverse: true,
        itemCount: publications.length,
        controller: controller,
        onPageChanged: (index) {
          print("Page changed to $index");
        },
        itemBuilder: (context, itemIndex) {
          return PubDevPublicationItem(
            p: publications[itemIndex],
            width: sectionSize.width,
          );
        },
      ),
    );
  }
}

class RivePublications extends StatelessWidget {
  const RivePublications({super.key});

  List<RiveArt> get riveArts => [
        const RiveArt(
          name: 'Truth or drink',
          animation: 'TOD',
          description:
              "Truth or Drink is a drinking game where players take turns asking each other questions. If someone doesn't want to answer, they take a drink instead. It's a fun way to get to know each other better while enjoying some drinks.",
          asset: 'tod.riv',
        ),
        const RiveArt(
          name: 'Anger',
          animation: 'Anger',
          description:
              'An intense emotional response to perceived threats, frustrations, or injustices. Anger often involves feelings of hostility, irritation, and the desire to assert dominance or control.',
          asset: 'anger.riv',
        ),
        const RiveArt(
          name: 'Contempt',
          animation: 'Contempt',
          description:
              'A mix of anger and disgust directed toward individuals or things perceived as inferior, worthless, or morally objectionable. Contempt often involves sneering, eye-rolling, or other dismissive gestures.',
          asset: 'contempt.riv',
        ),
        const RiveArt(
          name: 'Disgust',
          animation: 'Disgust',
          description:
              'An aversive emotion triggered by offensive stimuli or situations. Disgust can lead to physical reactions like nausea or grimacing and serves as a protective mechanism against potentially harmful substances.',
          asset: 'disgust.riv',
        ),
        const RiveArt(
          name: 'Fear',
          animation: 'Fear',
          description:
              "A primal emotion triggered by the anticipation of danger or threat. Fear activates the body's fight-or-flight response and can manifest as heightened alertness, trembling, or avoidance behaviors.",
          asset: 'fear.riv',
        ),
        const RiveArt(
          name: 'Happiness',
          animation: 'Happy',
          description:
              "A positive emotion characterized by feelings of joy, contentment, and satisfaction. Happiness is often accompanied by smiling, laughter, and a sense of well-being.",
          asset: 'happy.riv',
        ),
        const RiveArt(
          name: 'Sadness',
          animation: 'Sad',
          description:
              "A negative emotion associated with feelings of loss, disappointment, or sorrow. Sadness can manifest as tears, low energy, and a lack of motivation.",
          asset: 'sad.riv',
        ),
        const RiveArt(
          name: 'Surprise',
          animation: 'Surprise',
          description:
              "A brief emotional reaction to unexpected or startling events. Surprise often involves wide-eyed expression, raised eyebrows, and a sudden intake of breath.",
          asset: 'surprised.riv',
        ),
      ];

  BoxConstraints get riveConstraints => const BoxConstraints(
        maxHeight: 600,
        maxWidth: 600,
        minHeight: 200,
        minWidth: 200,
      );

  @override
  Widget build(BuildContext context) {
    return RivePublicationItemMenu(
      rives: riveArts,
    );
  }
}

class PubDevPublicationItem extends StatelessWidget {
  const PubDevPublicationItem({
    required this.p,
    this.width = 500,
    super.key,
  });

  final PubDevPackage p;
  final double width;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Card(
      child: SizedBox(
        width: width,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Text(
              p.name,
              style: themeData.listTileTheme.titleTextStyle,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: Image.asset(
                  p.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                p.about,
                style: themeData.listTileTheme.subtitleTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RivePublicationCardItem extends StatelessWidget {
  const RivePublicationCardItem({
    required this.r,
    super.key,
  });

  final RiveArt r;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return SizedBox(
      width: 300,
      child: Card(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Text(
              r.name,
              style: themeData.listTileTheme.titleTextStyle,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: RiveAnimation.asset(
                r.asset,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                r.description,
                style: themeData.listTileTheme.subtitleTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RivePublicationCircularItem extends StatelessWidget {
  const RivePublicationCircularItem({
    required this.r,
    this.width = 300,
    super.key,
  });

  final RiveArt r;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: RiveAnimation.asset(
        r.asset,
      ),
    );
  }
}

class RivePublicationItemMenu extends StatefulWidget {
  const RivePublicationItemMenu({required this.rives, super.key});

  final List<RiveArt> rives;

  @override
  State<RivePublicationItemMenu> createState() =>
      _RivePublicationItemMenuState();
}

class _RivePublicationItemMenuState extends State<RivePublicationItemMenu>
    with SingleTickerProviderStateMixin {
  ValueNotifier<bool> openNotifier = ValueNotifier(false);

  double get widthFactor => 5.5;

  late AnimationController controller;
  late final Animation<double> rotation = Tween<double>(
    begin: 0.0,
    end: 360.0,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.0,
        0.7,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    ),
  );

  late final Animation<double> scale = Tween<double>(
    begin: 1.5,
    end: 0.0,
  ).animate(
    CurvedAnimation(parent: controller, curve: Curves.elasticOut),
  );

  void open() {
    openNotifier.value = true;
    controller.forward();
  }

  void close() {
    openNotifier.value = false;
    controller.reverse();
  }

  List<RiveArt> get rives => widget.rives;

  Widget buildButton({
    required double angle,
    required Animation<double> translation,
    double width = 250,
    required RiveArt riveArt,
  }) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
            (translation.value) * cos(rad), (translation.value) * sin(rad)),
      child: RivePublicationCircularItem(
        r: riveArt,
        width: width,
      ),
    );
  }

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, size) {
        double diameter = (size.maxWidth / widthFactor);
        double radius = (diameter / 2);

        final Animation<double> translation = Tween<double>(
          begin: 0.0,
          end: diameter,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.slowMiddle),
        );

        return SizedBox(
          height: 1000,
          child: Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, __) {
                return ValueListenableBuilder(
                  valueListenable: openNotifier,
                  builder: (_, isOpen, __) => Transform.rotate(
                    angle: radians(rotation.value),
                    child: Stack(
                      alignment: Alignment.center,
                      children: rives.sublist(1).asMap().entries.map((r) {
                            double angle =
                                r.key * (360 / rives.sublist(1).length);

                            return buildButton(
                              angle: angle,
                              translation: translation,
                              riveArt: r.value,
                              width: isOpen ? diameter : radius,
                            );
                          }).toList() +
                          <Widget>[
                            Transform.scale(
                              scale: isOpen ? scale.value - 1 : scale.value,
                              child: GestureDetector(
                                onTap: () => isOpen ? close() : open(),
                                child: CircleAvatar(
                                  radius: radius - 20,
                                  backgroundColor:
                                      isOpen ? Colors.red : Colors.green,
                                  child: CircleAvatar(
                                    radius: radius - 25,
                                    child: RotatedBox(
                                      quarterTurns: isOpen ? 2 : 0,
                                      child: RivePublicationCircularItem(
                                        r: rives[0],
                                        width: isOpen ? radius : diameter + 100,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
