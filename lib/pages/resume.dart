import 'package:bruce_omukoko_portfolio/utils/web_view.dart';
import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({
    required this.goToCore,
    super.key,
  });

  String get resumeFileUri => "https://firebasestorage.googleapis.com/v0/b/bruce-omukoko.appspot.com/o/bruce_omukoko_resume_compressed.pdf?alt=media&token=26686801-0219-4124-985b-aef5f1fcb5ca";
  String get resumeUri =>
      "https://www.figma.com/file/c8UgYsEh6lNs0b2Lfp6f3P/CV-%26-Cover-Letter?type=design&node-id=603%3A2&mode=dev&t=1lQ1Yp2hwWXIKazM-1";

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
