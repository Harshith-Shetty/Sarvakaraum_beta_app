import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:sarvakaraum/main.dart';


void main() => runApp(MaterialApp(home: Blogs_dash()));

class Blogs_dash extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();

}

class HomeState extends State<Blogs_dash> {
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
                  _gridItem("c_screen","C"),
                  _gridItem("c_plus_screen","C++"),
                  _gridItem("java_screen","Java"),
                  _gridItem("python_screen","Py"),
                  _gridItem("c#_screen","C#"),
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
          _cardItem("blog1","What is C Programming","4 min","by Akshat Mehta"),
          _cardItem("blog2","Use of C Programming","15 min","by Rutuja Kumbhar"),
          _cardItem("blog3","Start with C Programming","3 min","by Aayush Joshi"),
          _cardItem("blog4","How to use Sarvakaraum","6 min","by Harshith Shetty"),
        ],
      ),
    );
  }
  _cardItem(image, title_text,read_time,author) {
    return Padding(padding:EdgeInsets.all(16.0),child:Row(
      children: <Widget>[
        Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/$image.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0)
            )
        ),
        SizedBox(width: 20.0),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title_text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                read_time,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:10.0),
              Text(
                author,
                style:
                TextStyle(fontWeight:FontWeight.bold, color: Colors.grey),
              )
            ]
        )
      ],
    )
    );
  }

  _gridItem(funct,text) {
    return Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              debugPrint(text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),   //Material button function
                ),
              );
            },
            shape: const StadiumBorder(),
            textColor: Colors.black,
            color: Colors.blue[300],
            splashColor: Colors.blue[900],
            disabledColor: Colors.grey,
            disabledTextColor: Colors.white,
            child: Text(text),
          ),
          /*CircleAvatar(
            child: Text(text),
            foregroundColor: Colors.red,
            backgroundColor: Colors.green,

          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home_screen()
                  ),
                );
              },
            ),
          SizedBox(height: 10.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 11.0,
            ),
          )*/
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
                  IconButton(
                    onPressed: () {
                      debugPrint("Starred Me!");
                    },
                    color: Colors.orangeAccent,
                    icon: Icon(Icons.star),
                    disabledColor: Colors.grey,
                    highlightColor: Colors.black38,
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

