import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

enum PublicationType {
  pubDev("Pub Dev"),
  rive("Rive");

  final String value;

  const PublicationType(this.value);
}

class PubDevPackage {
  final String name;
  final String about;
  final String url;

  const PubDevPackage({
    required this.name,
    required this.about,
    required this.url,
  });
}

// enum RiveArtTypes {}

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

class Publications extends StatelessWidget {
  const Publications({super.key});

  BoxConstraints get webViewConstraints => const BoxConstraints(
        maxHeight: 600,
        minHeight: 300,
      );

  List<PublicationType> get publicationTypeList => PublicationType.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Publications"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: publicationTypeList.length,
        itemBuilder: (_, i) {
          PublicationType p = publicationTypeList[i];
          return ExpansionTile(
            title: Text(p.value),
            children: [
              switch (p) {
                PublicationType.pubDev => const PubDevPublications(),
                PublicationType.rive => const RivePublications(),
              },
            ],
          );
        },
      ),
    );
  }
}

class PubDevPublications extends StatelessWidget {
  const PubDevPublications({super.key});

  List<PubDevPackage> get publications => const [
        PubDevPackage(
          name: "LRUMemoryCache",
          about:
              "A dart library used to cache data with an optional expiry date and callback functions",
          url: 'https://pub.dev/packages/lru_memory_cache',
        ),
        PubDevPackage(
          name: "Spinner Date Picker",
          about:
              "A minimally customizable flutter date picker library used to choose a date",
          url: 'https://pub.dev/packages/spinner_date_picker',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: publications.length,
      itemBuilder: (_, i) {
        PubDevPackage p = publications[i];
        return ListTile(
          onTap: () => openStringUri(p.url),
          title: Text(p.name),
          subtitle: Text(p.about),
        );
      },
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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: riveArts.length,
      itemBuilder: (_, i) {
        RiveArt p = riveArts[i];
        return ExpansionTile(
          title: Text(p.name),
          subtitle: Text(p.description),
          children: [
            ConstrainedBox(
              constraints: riveConstraints,
              child: RiveAnimation.asset(
                p.asset,
                // controllers: [
                //   OneShotAnimation(
                //     p.animation,
                //     autoplay: true,
                //   )
                // ],
              ),
            ),
          ],
        );
      },
    );
  }
}
