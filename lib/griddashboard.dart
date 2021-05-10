import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarvakaraum/screens/Blog/screens/home_page.dart';
import 'package:sarvakaraum/screens/course/main.dart';
import 'package:sarvakaraum/screens/compiler/main.dart';
import 'package:sarvakaraum/screens/Documentation/screens/home_screen.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 = new Items(
      title: "Courses",
      subtitle: "Learn with us",
      event: "3 Course",
      img: "assets/calendar.png",
      textf: "calendar",
      functioning : "Course_dash",
  );

  Items item2 = new Items(
    title: "Compiler",
    subtitle: "Edit, Compile and run programs",
    event: "4 Items",
    img: "assets/food.png",
    textf: "food",
    functioning : "Compiler_dash",
  );

  Items item3 = new Items(
    title: "Documentation",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "assets/map.png",
    textf: "map",
    functioning : "Docs_dash",
  );

  Items item4 = new Items(
    title: "Blogs",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "assets/festival.png",
    textf: "festival",
    functioning : "Blogs_dash",
  );

  Items item5 = new Items(
    title: "Workshop",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/todo.png",
    textf: "todo",
    functioning: "Workshop_dash",
  );

  Items item6 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "assets/setting.png",
    textf: "setting",
    functioning : "Settings_dash",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Image.asset(
                    data.img,
                    width: 42,

                  ),*/
                  Material(
                      child: InkWell(
                        /*onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home_screen(),   //Material button function
                            ),
                          );
                        },*/
                        onTap: () {
                          if (data.functioning == "Course_dash") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Course_dash(),   //Material button function
                              ),
                            );
                          }
                          else if (data.functioning == "Compiler_dash") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Compiler_dash(),   //Material button function
                              ),
                            );
                          }
                          else if (data.functioning == "Docs_dash") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Docs_dash(),   //Material button function
                              ),
                            );
                          }
                          else if (data.functioning == "Blogs_dash") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Blogs_dash(),   //Material button function
                              ),
                            );
                          }/*
                          else if (data.functioning == "Workshop_dash") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Workshop_dash(),   //Material button function
                              ),
                            );
                          }
                          else if (data.functioning == "Settings_dash") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Settings_dash(),   //Material button function
                              ),
                            );  //Navigator.push
                          } //elseif */
                        },
                        child: Container(
                          child: ClipRRect(
                            //borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(data.img,
                            width: 42,)
                          ),),
                      )
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),

                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  String textf;
  String functioning;
  Items( {this.title, this.subtitle, this.event, this.img, this.textf, this.functioning });
}