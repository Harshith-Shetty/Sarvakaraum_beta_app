import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(cplus_web());

class cplus_web extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C++ Compiler',
      home: Scaffold(
        appBar: AppBar(
          title: Text('C++ Compiler'),
        ),
        body: WebView(
          initialUrl:"https://main.d31te9s3lvqqdw.amplifyapp.com/",
          //javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

