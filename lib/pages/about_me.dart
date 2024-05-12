import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Text(
            "About me",
            style: GoogleFonts.poppins(
              fontSize: 60,
            ),
          ),
        ),


        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hey there! I’m Bruce Omukoko, chilling out in Nairobi and always up for a good problem-solving challenge mixed with a healthy dose of creativity. I’m all about learning new stuff and figuring out cool ways to tackle problems, whether it’s in my work or just day-to-day life.",
                style: textTheme.bodyLarge?.copyWith(fontSize: 23),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              "assets/bruce.png",
              fit: BoxFit.contain,
              width: double.infinity,
              height: 400,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "When I’m not deep in thought, you can probably find me gaming, getting rough and tumble on the rugby field, or just hanging out with friends. Life’s too short not to enjoy a good game and some great company, right?",
                style: textTheme.bodyLarge?.copyWith(fontSize: 23),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              "bruce_rugby.jpg",
              fit: BoxFit.contain,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "So yeah, that’s me – always looking for the next adventure and bringing a bit of creative flair to everything I do.",
                style: textTheme.bodyLarge?.copyWith(fontSize: 23),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),


      ],
    );
  }
}
