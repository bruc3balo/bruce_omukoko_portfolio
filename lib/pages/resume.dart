import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class ResumeView extends StatelessWidget {
  ResumeView({
    super.key,
  });

  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  );

  final LoadRequestParams params = LoadRequestParams(
    uri: Uri.parse(
        'https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Ffile%2Fc8UgYsEh6lNs0b2Lfp6f3P%2FCV-%2526-Cover-Letter%3Ftype%3Ddesign%26node-id%3D603%253A2%26mode%3Ddesign%26t%3DixOoEEbt7eCGBGQR-1'),
  );

  Future<void> loadPage() async {
    await Future.delayed(const Duration(seconds: 2));
    await _controller.loadRequest(params);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadPage(),
      builder: (_, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: PlatformWebViewWidget(
            PlatformWebViewWidgetCreationParams(controller: _controller),
          ).build(context),
        );
      },
    );
  }
}
