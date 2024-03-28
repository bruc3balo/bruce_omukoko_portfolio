import 'package:bruce_omukoko_portfolio/pages/splash_screen.dart';
import 'package:bruce_omukoko_portfolio/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApplication());
}

class PortfolioApplication extends StatelessWidget {
  const PortfolioApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        initialRoute: Routes.splashScreen.path,
        routes: {
          Routes.splashScreen.path: (context) => const SplashScreen(),
        },
      ),
    );
  }
}
