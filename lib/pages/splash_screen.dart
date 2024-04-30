import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({required this.goToCore, super.key});

  final Function() goToCore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goToCore,
      child: const Center(
        child: Text('Click to continue'),
      ),
    );
  }
}
