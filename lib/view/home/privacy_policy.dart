import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrivacyPolicyState();
  }
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  //
  WebViewController? webController;
  String filePath = 'asset/Policy.html';
  @override
  void initState() {
    print('-----');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) async {
            webController = webViewController;
            await loadHtmlFromAssets('asset/Policy.html', webController);
          },
        ),
      ),
    );
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
