import 'package:bruce_omukoko_portfolio/utils/functions.dart';
import 'package:bruce_omukoko_portfolio/utils/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Published {
  final String name;
  final String about;
  final String url;

  const Published({
    required this.name,
    required this.about,
    required this.url,
  });
}

class Publications extends StatelessWidget {
  const Publications({super.key});

  BoxConstraints get webViewConstraints => const BoxConstraints(
        maxHeight: 600,
        minHeight: 300,
      );

  List<Published> get publications => const [
        Published(
          name: "LRUMemoryCache",
          about:
              "A dart library used to cache data with an optional expiry date and callback functions",
          url: 'https://pub.dev/packages/lru_memory_cache',
        ),
        Published(
          name: "Spinner Date Picker",
          about:
              "A minimally customizable flutter date picker library used to choose a date",
          url: 'https://pub.dev/packages/spinner_date_picker',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Publications"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: publications.length,
        itemBuilder: (_, i) {
          Published p = publications[i];
          return ListTile(
            onTap: () => openStringUri(p.url),
            title: Text(p.name),
            subtitle: Text(p.about),
          );
        },
      ),
    );
  }
}
