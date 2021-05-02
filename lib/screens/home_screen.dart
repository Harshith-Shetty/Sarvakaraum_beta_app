import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';


void main() => runApp(MaterialApp(home: Home_screen()));

class Home_screen extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();

}

class HomeState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _top(),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:22.0),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:12.0),
                  ),
                ]
            )
          ),
          SizedBox(height: 20.0),
          Container(
            height:200.0,
            child: GridView(
              gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 3/2),
              children: <Widget>[
                _gridItem(Icons.dashboard,"C"),
                _gridItem(Icons.menu,"C++"),
                _gridItem(Icons.book,"Java"),
                _gridItem(Icons.computer,"Python"),
                _gridItem(Icons.pending_actions,"C#"),
              ]
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Latest",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          _cardItem(1),
          _cardItem(2),
          _cardItem(3),
          _cardItem(4),
        ],
      ),
    );
  }

  _gridItem(icon,text) {
    return Column(
      children: <Widget>[
        CircleAvatar(
            child: Icon(
            icon,size: 16.0,
            color:Colors.white,
          ),
          backgroundColor: Colors.deepOrange.withOpacity(0.9),
        ),
        SizedBox(height: 10.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 11.0,
          ),
        )
      ]
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(
          bottomLeft:Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("assets\images\profile_face_purple_500px.png"),
                  ),
                  SizedBox(width: 10.0),
                  Text("Hi, Username",style: TextStyle(color: Colors.white),),
                ],
              ),
              IconButton(
                  icon: Icon(
                      Icons.notifications,
                      color: Colors.white
                  ),
                  onPressed: () {},
              )
            ],
          ),
          SizedBox(height: 30.0),
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Colors.white,
              filled: true,
              suffixIcon: Icon(Icons.filter_list),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)
              ),
            )
        ],
      ),
    );
  }
}

/*class varitem {
  var no = 0;
  var array1 = ['C','C++','Java'],
  number;
  return array1[number];

}*/