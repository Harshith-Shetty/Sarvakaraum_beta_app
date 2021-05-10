
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
/*
class data_type_full extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SfPdfViewer.network(
                'http://ebooks.syncfusion.com/downloads/flutter-succinctly/flutter-succinctly.pdf')
        )
    );
  }
}
*/

void data_full() {
  runApp(MaterialApp(
    title: 'Syncfusion PDF Viewer Demo',
    home: data_type_chp2(),
  ));
}

/// Represents Homepage for Navigation
class data_type_chp2 extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<data_type_chp2> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primary Data Types'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://sarvakaraum.s3.amazonaws.com/Books/ENGLISH/Data+Types/(Data+Types)chp2_Primary+Data+Types.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}