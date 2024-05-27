import 'package:bruce_omukoko_portfolio/data/data.dart';
import 'package:bruce_omukoko_portfolio/utils/web_view.dart';
import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({
    required this.goToCore,
    super.key,
  });


  final Function() goToCore;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => goToCore(),
      child: Scaffold(
        body: WebView(
          uri: resumeFileUri,
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: goToCore,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
          ),
          child: const Text("Exit"),
        ),
      ),
    );
  }
}
