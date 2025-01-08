import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ValueNotifier<bool> splashNotifier = ValueNotifier(true);

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => splashNotifier.value = false,
    );
    super.initState();
  }

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
              body: Center(
                child: LoadingAnimationWidget.beat(
                  color: orange,
                  size: 200,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
