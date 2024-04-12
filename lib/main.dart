import 'package:bruce_omukoko_portfolio/pages/home.dart';
import 'package:bruce_omukoko_portfolio/pages/projects.dart';
import 'package:bruce_omukoko_portfolio/pages/publications.dart';
import 'package:bruce_omukoko_portfolio/pages/resume.dart';
import 'package:bruce_omukoko_portfolio/pages/skills.dart';
import 'package:bruce_omukoko_portfolio/pages/splash_screen.dart';
import 'package:bruce_omukoko_portfolio/routes/routes.dart';
import 'package:bruce_omukoko_portfolio/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PortfolioApplication());
}

class PortfolioApplication extends StatelessWidget {
  const PortfolioApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen.path,
        routes: {
          Routes.splashScreen.path: (context) => const SplashScreen(),
          Routes.resume.path: (context) => const ResumeView(),
          Routes.home.path: (context) => const HomePage(),
        },
      ),
    );
  }
}
