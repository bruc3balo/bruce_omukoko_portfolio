import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Image.asset(
              "bruce.jpg",
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hey there! I’m Bruce Omukoko, chilling out in Nairobi and always up for a good problem-solving challenge mixed with a healthy dose of creativity. I’m all about learning new stuff and figuring out cool ways to tackle problems, whether it’s in my work or just day-to-day life.",
                    style: textTheme.bodyLarge?.copyWith(fontSize: 23),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "When I’m not deep in thought, you can probably find me gaming, getting rough and tumble on the rugby field, or just hanging out with friends. Life’s too short not to enjoy a good game and some great company, right? So yeah, that’s me – always looking for the next adventure and bringing a bit of creative flair to everything I do.",
                    style: textTheme.bodyLarge?.copyWith(fontSize: 25),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
