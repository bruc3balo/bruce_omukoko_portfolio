import 'package:bruce_omukoko_portfolio/utils/web_view.dart';
import 'package:flutter/material.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({
    super.key,
  });

  String get resumeUri =>
      "https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Ffile%2Fc8UgYsEh6lNs0b2Lfp6f3P%2FCV-%2526-Cover-Letter%3Ftype%3Ddesign%26node-id%3D603%253A2%26mode%3Ddesign%26t%3DixOoEEbt7eCGBGQR-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bruce Omukoko's Resume"),
      ),
      body: WebView(
        uri: resumeUri,
      ),
    );
  }
}
