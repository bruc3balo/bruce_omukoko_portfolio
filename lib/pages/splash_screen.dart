import 'package:bruce_omukoko_portfolio/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.home.path, (route) => false),
        ),
        builder: (_, snap) {
          return Center(
            child: Text('Splash screen'),
          );
        },
      ),
    );
  }
}
