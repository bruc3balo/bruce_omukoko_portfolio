import 'dart:async';

import 'package:bruce_omukoko_portfolio/data/data.dart';
import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:bruce_omukoko_portfolio/utils/extensions.dart';

// import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lru_memory_cache/lru_memory_cache.dart';
import 'package:rive/rive.dart' hide Image;
import 'package:spinner_date_picker/date_picker/date_picker.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;


enum PublicationType {
  pubDev("PubDev"),
  rive("Rive");

  final String value;

  const PublicationType(this.value);

  Widget get widget => switch (this) {
    PublicationType.pubDev => SvgPicture.asset("bruc3balo/assets/dart.svg"),
    PublicationType.rive => Image.asset("bruc3balo/assets/rive.jpeg"),
  };
}

class PubDevPackage {
  final String name;
  final String about;
  final String url;
  final PubPackage package;

  const PubDevPackage({
    required this.name,
    required this.about,
    required this.url,
    required this.package,
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

  List<PublicationType> get publicationTypeList =>
      PublicationType.values.sublist(1, 2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Publications",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 60,
              color: orange,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: publicationTypeList.length,
          itemBuilder: (_, i) {
            PublicationType p = publicationTypeList[i];
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: switch (p) {
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
          package: PubPackage.lruMemoryCache,
        ),
        PubDevPackage(
          name: "Spinner Date Picker",
          about:
              "A minimally customizable flutter date picker library used to choose a date",
          url: 'https://pub.dev/packages/spinner_date_picker',
          package: PubPackage.spinnerDatePicker,
        ),
      ];

  Size get sectionSize => const Size(500, 500);

  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionSize.height,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          IconButton(
            onPressed: () => controller.previousPage(
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
            ),
            icon: const Icon(Icons.arrow_circle_left),
          ),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              allowImplicitScrolling: false,
              itemCount: publications.length,
              controller: controller,
              onPageChanged: (index) {
                //print("Page changed to $index");
              },
              itemBuilder: (context, itemIndex) {
                return PubDevPublicationItem(
                  p: publications[itemIndex],
                  width: sectionSize.width,
                );
              },
            ),
          ),
          IconButton(
            onPressed: () => controller.nextPage(
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
            ),
            icon: const Icon(Icons.arrow_circle_right),
          ),
        ],
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
          asset: 'bruc3balo/assets/tod.riv',
        ),
        const RiveArt(
          name: 'Anger',
          animation: 'Anger',
          description:
              'An intense emotional response to perceived threats, frustrations, or injustices. Anger often involves feelings of hostility, irritation, and the desire to assert dominance or control.',
          asset: 'bruc3balo/assets/anger.riv',
        ),
        const RiveArt(
          name: 'Contempt',
          animation: 'Contempt',
          description:
              'A mix of anger and disgust directed toward individuals or things perceived as inferior, worthless, or morally objectionable. Contempt often involves sneering, eye-rolling, or other dismissive gestures.',
          asset: 'bruc3balo/assets/contempt.riv',
        ),
        const RiveArt(
          name: 'Disgust',
          animation: 'Disgust',
          description:
              'An aversive emotion triggered by offensive stimuli or situations. Disgust can lead to physical reactions like nausea or grimacing and serves as a protective mechanism against potentially harmful substances.',
          asset: 'bruc3balo/assets/disgust.riv',
        ),
        const RiveArt(
          name: 'Fear',
          animation: 'Fear',
          description:
              "A primal emotion triggered by the anticipation of danger or threat. Fear activates the body's fight-or-flight response and can manifest as heightened alertness, trembling, or avoidance behaviors.",
          asset: 'bruc3balo/assets/fear.riv',
        ),
        const RiveArt(
          name: 'Happiness',
          animation: 'Happy',
          description:
              "A positive emotion characterized by feelings of joy, contentment, and satisfaction. Happiness is often accompanied by smiling, laughter, and a sense of well-being.",
          asset: 'bruc3balo/assets/happy.riv',
        ),
        const RiveArt(
          name: 'Sadness',
          animation: 'Sad',
          description:
              "A negative emotion associated with feelings of loss, disappointment, or sorrow. Sadness can manifest as tears, low energy, and a lack of motivation.",
          asset: 'bruc3balo/assets/sad.riv',
        ),
        const RiveArt(
          name: 'Surprise',
          animation: 'Surprise',
          description:
              "A brief emotional reaction to unexpected or startling events. Surprise often involves wide-eyed expression, raised eyebrows, and a sudden intake of breath.",
          asset: 'bruc3balo/assets/surprised.riv',
        ),
      ];

  BoxConstraints get riveConstraints => const BoxConstraints(
        maxHeight: 500,
        maxWidth: 500,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                p.name,
                style: themeData.listTileTheme.titleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: switch (p.package) {
                PubPackage.spinnerDatePicker => SpinnerDatePickerDemo(),
                PubPackage.lruMemoryCache => LRUBallsDemo(),
              },
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

class BallDemo {
  final int id;
  final Widget widget;

  BallDemo(this.id, this.widget);
}

class LRUBallsDemo extends StatelessWidget {
  LRUBallsDemo({super.key});

  late final LRUMemoryCache<int, BallDemo> cache = LRUMemoryCache(
    generateKey: (b) => b.id,
    autoExpireCheckDuration: const Duration(seconds: 1),
    expireMode: ExpireMode.autoExpire,
    onExpire: (id, ball) {
      listNotifier.value = Map.from(listNotifier.value..remove(id));
      return true;
    },
    onCapacityRemoved: (id, ball) {
      listNotifier.value = Map.from(listNotifier.value..remove(id));
    },
  );

  final ValueNotifier<Map<int, BallDemo>> listNotifier = ValueNotifier({});

  final keys = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    // int count = 0;

    return LayoutBuilder(builder: (_, size) {
      return Scaffold(
        body: ValueListenableBuilder<Map<int, BallDemo>>(
          valueListenable: listNotifier,
          builder: (_, list, __) {
            var balls = list.values.toList();

            return Flex(
              direction: Axis.horizontal,
              children: [
                Flex(
                  direction: Axis.vertical,
                  children: balls
                      .map(
                        (e) => Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: Text(
                                "${e.id}",
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Expanded(
                  child: Stack(
                    children: balls
                        .map(
                          (ball) => LRUBallDemo(
                            color: Colors.white,
                            ball: ball,
                            constraints: size,
                            onSelect: (i) {
                              cache.get(i.id);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.small(
                onPressed: () async {
                  return;
                  /*var time = await showDurationPicker(
                    context: context,
                    initialTime: const Duration(seconds: 15),
                    baseUnit: BaseUnit.second,
                  );

                  if (time == null) return;

                  debugPrint("time is ${time.inSeconds}");

                  var id = count++;
                  var ball = BallDemo(
                    id,
                    Text(
                      "$id",
                      style: GoogleFonts.aBeeZee(color: Colors.black),
                    ),
                  );
                  cache.add(ball, expiryDuration: time);
                  listNotifier.value = cache.dataMap;*/
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.small(
                onPressed: () {
                  //count = 0;
                },
                child: const Icon(Icons.refresh, color: Colors.black),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class LRUBallDemo extends StatefulWidget {
  const LRUBallDemo({
    required this.color,
    required this.ball,
    required this.constraints,
    required this.onSelect,
    super.key,
  });

  final Color color;
  final BallDemo ball;
  final BoxConstraints constraints;
  final Function(BallDemo) onSelect;

  @override
  State<LRUBallDemo> createState() => _LRUBallDemoState();
}

class _LRUBallDemoState extends State<LRUBallDemo> {
  BallDemo get tech => widget.ball;

  double get maxWidth => widget.constraints.maxWidth;

  double get maxHeight => 500;
  bool movingLeft = Random().nextInt(10) < 5;
  bool movingTop = Random().nextInt(10) > 5;
  late Timer timer;

  late final ValueNotifier<Size> positionNotifier = ValueNotifier(
    Size(
      Random().nextInt(maxWidth.floor()).floorToDouble(),
      Random().nextInt(maxHeight.floor()).floorToDouble(),
    ),
  );

  Duration get syncSpeed => const Duration(milliseconds: 500);

  Timer start() {
    return Timer.periodic(
      syncSpeed,
      (timer) {
        Size oldPosition = positionNotifier.value;

        double newWidth = oldPosition.width;
        double newHeight = oldPosition.height;

        if (oldPosition.width >= maxWidth - 130) movingLeft = true;
        if (oldPosition.width <= 0) movingLeft = false;

        if (oldPosition.height >= maxHeight - 130) movingTop = true;
        if (oldPosition.height <= 0) movingTop = false;

        //detect side edge position
        if (movingLeft) {
          newWidth -= 10;
        } else {
          newWidth += 10;
        }

        //detect top edge position
        if (movingTop) {
          newHeight -= 10;
        } else {
          newHeight += 10;
        }

        // print("Width: $newWidth, Height: $newHeight, movingLeft: $movingLeft, movingTop: $movingTop");

        positionNotifier.value = Size(
          newWidth,
          newHeight,
        );
      },
    );
  }

  void pause() {
    if (!timer.isActive) return;
    timer.cancel();
  }

  @override
  void initState() {
    timer = start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: positionNotifier,
      builder: (_, position, __) {
        return AnimatedPositioned(
          duration: syncSpeed,
          top: position.height,
          left: position.width,
          curve: Curves.linear,
          child: GestureDetector(
            onTap: () => widget.onSelect(tech),
            dragStartBehavior: DragStartBehavior.down,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: widget.color,
              child: CircleAvatar(
                radius: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.ball.widget,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SpinnerDatePickerDemo extends StatelessWidget {
  SpinnerDatePickerDemo({super.key});

  final ValueNotifier<DateTime> dateNotifier = ValueNotifier(
    DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder(
                valueListenable: dateNotifier,
                builder: (_, date, __) {
                  return Text(
                    date.readableDateOnly,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              SpinnerDatePicker(
                dayText: (date) => Text(
                  date,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                textStyle: GoogleFonts.aBeeZee(
                  fontSize: 20,
                ),
                initialDate: dateNotifier.value,
                onDateChanged: (date) => dateNotifier.value = date,
                dateOptions: const [
                  DateOptions.d,
                  DateOptions.m,
                  DateOptions.y
                ],
              ),
            ],
          ),
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

  double widthFactor = 4.5;
  late Timer timer;

  Duration get riveDuration => const Duration(seconds: 1);

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

  final ValueNotifier<double> scaleNotifier = ValueNotifier(1.0);
  bool reverse = false;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    timer = Timer.periodic(riveDuration, (timer) {
      double val = scaleNotifier.value;

      if (val <= 0.9) {
        reverse = false;
      } else if (val >= 1.1) {
        reverse = true;
      }

      if (reverse) {
        val -= 0.1;
      } else {
        val += 0.1;
      }

      scaleNotifier.value = val;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, size) {
        widthFactor = size.maxWidth > 700 ? 5.5 : 3.0;

        double diameter = (size.maxWidth / widthFactor);
        double radius = (diameter / 2);

        final Animation<double> translation = Tween<double>(
          begin: 0.0,
          end: diameter,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.slowMiddle,
          ),
        );

        return ValueListenableBuilder(
            valueListenable: openNotifier,
            builder: (_, isOpen, __) {
            return AnimatedSize(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: isOpen ? 600 : 200,
                child: Center(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) {
                      return Transform.rotate(
                        angle: radians(rotation.value),
                        child: Stack(
                          alignment: Alignment.center,
                          children: rives.sublist(1).asMap().entries.map(
                                (r) {
                                  double angle =
                                      r.key * (360 / rives.sublist(1).length);

                                  return buildButton(
                                    angle: angle,
                                    translation: translation,
                                    riveArt: r.value,
                                    width: isOpen ? diameter : radius,
                                  );
                                },
                              ).toList() +
                              <Widget>[
                                Transform.scale(
                                  scale: isOpen ? scale.value - 1 : scale.value,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () => isOpen ? close() : open(),
                                      child: ValueListenableBuilder(
                                        valueListenable: scaleNotifier,
                                        builder: (_, scale, __) {
                                          return AnimatedScale(
                                            scale: scale,
                                            duration: riveDuration,
                                            child: CircleAvatar(
                                              radius: radius - 20,
                                              backgroundColor: isOpen
                                                  ? Colors.red
                                                  : Colors.green,
                                              child: CircleAvatar(
                                                radius: radius - 25,
                                                child: RotatedBox(
                                                  quarterTurns: isOpen ? 2 : 0,
                                                  child:
                                                      RivePublicationCircularItem(
                                                    r: rives[0],
                                                    width: isOpen
                                                        ? radius
                                                        : diameter + 100,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        );
      },
    );
  }
}
