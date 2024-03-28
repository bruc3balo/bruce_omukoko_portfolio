import 'package:bruce_omukoko_portfolio/pages/resume.dart';
import 'package:bruce_omukoko_portfolio/pages/splash_screen.dart';
import 'package:bruce_omukoko_portfolio/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApplication());
}

class PortfolioApplication extends StatelessWidget {
  const PortfolioApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        initialRoute: Routes.resume.path,
        routes: {
          Routes.splashScreen.path: (context) => const SplashScreen(),
          Routes.resume.path: (context) => ResumeView(),
        },
      ),
    );
  }
}
