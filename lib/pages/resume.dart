import 'package:bruce_omukoko_portfolio/utils/web_view.dart';
import 'package:flutter/material.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({
    super.key,
  });

  String get resumeFileUri => "https://firebasestorage.googleapis.com/v0/b/bruce-omukoko.appspot.com/o/bruce_omukoko_resume_compressed.pdf?alt=media&token=26686801-0219-4124-985b-aef5f1fcb5ca";
  String get resumeUri =>
      "https://www.figma.com/file/c8UgYsEh6lNs0b2Lfp6f3P/CV-%26-Cover-Letter?type=design&node-id=603%3A2&mode=dev&t=1lQ1Yp2hwWXIKazM-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bruce Omukoko's Resume"),
      ),
      body: WebView(
        uri: resumeFileUri,
      ),
    );
  }
}
