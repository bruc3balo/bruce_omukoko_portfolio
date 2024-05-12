import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({
    required this.goToResume,
    super.key,
  });

  final Function() goToResume;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
          "assets/bruce_rugby.jpg",
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

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.center,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: goToResume,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("View Resume"),
                  ),
                  Icon(Icons.arrow_circle_right),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
