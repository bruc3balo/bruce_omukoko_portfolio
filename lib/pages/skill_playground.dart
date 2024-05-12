import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bruce_omukoko_portfolio/pages/skills.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void showTechnologyInfo({
  required BuildContext context,
  required SkillBoard skillBoard,
  required Technologies technologies,
}) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      var theme = Theme.of(context);
      return BottomSheet(
        onClosing: () {},
        builder: (_) {
          return Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Text(
                technologies.name,
                style: theme.listTileTheme.titleTextStyle,
              ),
              Text(
                technologies.xp,
                style: theme.listTileTheme.subtitleTextStyle,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: technologies.abilities.length,
                  itemBuilder: (_, i) {
                    Ability a = technologies.abilities[i];
                    return Visibility(
                      visible: a.points.isNotEmpty,
                      replacement: ListTile(
                        title: Text(a.name),
                        subtitle: Text(a.brief),
                      ),
                      child: ExpansionTile(
                        title: Text(a.name),
                        subtitle: Text(a.brief),
                        children: a.points
                            .map(
                              (e) => ListTile(
                                leading: const Icon(Icons.chevron_right),
                                title: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      );
    },
  );
}

class SkillPlayground extends StatelessWidget {
  const SkillPlayground({required this.goToCore, super.key});

  final Function() goToCore;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => goToCore(),
      child: Scaffold(
       bottomNavigationBar: ElevatedButton(
         onPressed: goToCore,

         style: const ButtonStyle(
           backgroundColor: MaterialStatePropertyAll(Colors.red),
         ),
         child: Text("Exit"),
       ),
        body: LayoutBuilder(
          builder: (context, size) {
            return Stack(
              children: skills
                  .expand(
                    (s) => s.technologies
                        .map(
                          (t) => TechnologyBoard(
                            color: s.color,
                            technologies: t,
                            constraints: size,
                            onSelect: (t) => showTechnologyInfo(
                              context: context,
                              skillBoard: s,
                              technologies: t,
                            ),
                          ),
                        )
                        .toList(),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}

class TechnologyBoard extends StatefulWidget {
  const TechnologyBoard({
    required this.color,
    required this.technologies,
    required this.constraints,
    required this.onSelect,
    super.key,
  });

  final Color color;
  final Technologies technologies;
  final BoxConstraints constraints;
  final Function(Technologies) onSelect;

  @override
  State<TechnologyBoard> createState() => _TechnologyBoardState();
}

class _TechnologyBoardState extends State<TechnologyBoard> {
  Technologies get tech => widget.technologies;

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
          curve: tech.curves,
          child: GestureDetector(
            onTap: () => widget.onSelect(tech),
            onVerticalDragUpdate: (d) {
              var globalPosition = d.globalPosition;
              positionNotifier.value = Size(
                globalPosition.dx,
                globalPosition.dy,
              );
            },
            dragStartBehavior: DragStartBehavior.down,
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.technologies.cover,
                  ),
                ),
                AutoSizeText(widget.technologies.name),
              ],
            ),
          ),
        );
      },
    );
  }
}
