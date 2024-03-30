import 'package:bruce_omukoko_portfolio/pages/contact_me.dart';
import 'package:bruce_omukoko_portfolio/routes/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          emailMe,
          contactMe(context),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                Routes.resume.path,
              ),
              title: const Text("Resume"),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                Routes.publications.path,
              ),
              title: const Text("Publications"),
            ),
          ],
        ),
      ),
    );
  }
}
