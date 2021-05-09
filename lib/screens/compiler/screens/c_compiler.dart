import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(c_web());

class c_web extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C Compiler',
      home: Scaffold(
        appBar: AppBar(
          title: Text('C Compiler'),
        ),
        body: WebView(
          initialUrl:"https://main.d39gvr2mo23zdt.amplifyapp.com/",
          //javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      );
  }
}

