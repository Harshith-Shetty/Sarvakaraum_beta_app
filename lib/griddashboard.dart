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
      img: "assets/course_classroom-removebg-preview.png",
      textf: "calendar",
      functioning : "Course_dash",
  );

  Items item2 = new Items(
    title: "Compiler",
    subtitle: "Edit, Compile and run programs",
    event: "4 Items",
    img: "assets/compiler-removebg-preview.png",
    textf: "food",
    functioning : "Compiler_dash",
  );

  Items item3 = new Items(
    title: "Documentation",
    subtitle: "Read and Learn",
    event: "",
    img: "assets/documentation-removebg-preview.png",
    textf: "map",
    functioning : "Docs_dash",
  );

  Items item4 = new Items(
    title: "Blogs",
    subtitle: "Get updates",
    event: "",
    img: "assets/blog-removebg-preview.png",
    textf: "festival",
    functioning : "Blogs_dash",
  );

  /*Items item5 = new Items(
    title: "Workshop",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/todo.png",
    textf: "todo",
    functioning: "Workshop_dash",
  );

  Items item5 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "assets/setting.png",
    textf: "setting",
    functioning : "Settings_dash",
  );*/

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xffffffff;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(15), ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Image.asset(
                    data.img,
                    width: 42,

                  ),*/
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                      child: InkWell(

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
                            width: 100,)
                          ),),
                      )
                  ),
                  SizedBox(
                    height: 10,
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
                    height: 4,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 10,
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