import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class WebView extends StatelessWidget {
  WebView({
    required this.uri,
    super.key,
  });

  final String uri;

  Uri get parsedUri => Uri.parse(uri);

  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  );

  late final LoadRequestParams params = LoadRequestParams(
    uri: parsedUri,
    headers: {
      "X-FRAME-OPTIONS": "ALLOW-FROM *",
      "Access-Control-Allow-Origin": "*,"
    },
  );

  Future<void> loadPage() async {
    await Future.delayed(const Duration(seconds: 2));
    await _controller.loadRequest(params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: loadPage(),
          builder: (_, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }

            return PlatformWebViewWidget(
              PlatformWebViewWidgetCreationParams(controller: _controller),
            ).build(context);
          },
        ),
      ),
    );
  }
}
