import 'constants.dart';
import 'details_screen.dart';
import 'modules/Advance_of_c.dart';
import 'modules/intro_c_programming.dart';
import 'model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'modules/advance_of_pointer.dart';
import 'modules/c_programming_for_begin.dart';

void main() => runApp(Course_dash_theme());

class Course_dash_theme extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sarvakaraum Courses',
      theme: ThemeData(),
      home: DetailsScreen(),
    );
  }
}

class Course_dash extends StatelessWidget {
  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffee4),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/menu.svg"),
                Image.asset("assets/images/users.png"),
              ],
            ),
            SizedBox(height: 30),
            Text("Hey User,", style: kHeadingextStyle),
            Text("Find a course you want to learn", style: kSubheadingextStyle),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFfed9b7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: 16),
                  Text(
                    "Search for anything",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff0a0a0a),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Category", style: kTitleTextStyle),
                Text(
                  "See All",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            //builder: (context) => DetailsScreen(),   //Material button function
                           builder: (context) => intro_c(),
                           //builder: (context) => DetailsScreen(),
                           //builder: (context) => DetailsScreen(),
                           //builder: (context) => DetailsScreen(),

                          ),
                        );*/
                        if (categories[index].screening == "intro_c") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => intro_c(),   //Material button function
                            ),
                          );
                        }
                        else if (categories[index].screening == "c_prog_begin") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => c_prog_begin(),   //Material button function
                            ),
                          );
                        }
                        else if (categories[index].screening == "adva_c") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => adva_c(),   //Material button function
                            ),
                          );
                        }
                        else if (categories[index].screening == "adva_c_point") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => adva_c_point(),   //Material button function
                            ),
                          );
                        }
                  },
                  child: new Container(
                    padding: EdgeInsets.all(20),
                    height: index.isEven ? 200 : 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(categories[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          categories[index].name,
                          style: kTitleTextStyle,
                        ),
                        Text(
                          '${categories[index].numOfCourses} Courses',
                          style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
