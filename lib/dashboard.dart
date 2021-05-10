import 'package:flutter/material.dart';
import 'package:flutter/src/material/drawer.dart';
import 'package:flutter/src/material/flat_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';
void main() => runApp(MaterialApp(home: dashboard()));

class dashboard extends StatefulWidget {
  @override
  dashboard_State createState() => new dashboard_State();

}

class dashboard_State extends State<dashboard> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          //leading: Icon(Icons.menu, color: Colors.green)
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.translate_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
            )
          ],
          backgroundColor: Color(0xffddd0cb),
          title: Text("Sarvakaraum", style: TextStyle(color: Colors.black87))
      ),
      /*drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Username"),
              accountEmail: new Text("username@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Text('U', style: TextStyle(color: Colors.black87))
              ),
              decoration: new BoxDecoration(
                color: Colors.purple,
              ),
            ),
            new ListTile(
                leading: Icon(Icons.home),
                title: new Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.person),
                title: new Text("Friends"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.share),
                title: new Text("Share"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new Divider(),
            new ListTile(
                leading: Icon(Icons.settings),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),*/
      backgroundColor: Color(0xffddd0cb),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Welcome,",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold)),
                    ),

                    Text(
                      "user",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(
            height: 45,
          ),
          GridDashboard()

        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Languages'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("select language", style: TextStyle(fontWeight: FontWeight.w300)),

          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('English'),
          ),
          //SizedBox.fromSize()
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Hindi (हिन्दी) '),
          ),
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Marathi(मराठी)'),
          ),
          //SizedBox.fromSize()
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Gujarathi(ગુજરાતી)'),
          ),

        ],
      ),
    );
  }
}
