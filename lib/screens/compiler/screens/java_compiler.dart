import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(java_web());

class java_web extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Java Compiler',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Java Compiler'),
        ),
        body: WebView(
          initialUrl:"https://main.d31te9s3lvqqdw.amplifyapp.com/",
          //javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

