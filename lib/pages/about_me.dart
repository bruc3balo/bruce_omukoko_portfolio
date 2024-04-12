import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Hey there, I'm Bruce \n",
            style: textTheme.titleLarge,
          ),

          Text(
            "A software developer passionate in solving problems",
            style: textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}
