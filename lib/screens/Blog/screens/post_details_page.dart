import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String date;
  PostDetailsPage(
      {@required this.title,
      @required this.image,
      @required this.author,
      @required this.date});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.bookmark_outline,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_outline,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.share_outlined,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        /*child: BottomAppBar(
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.headset,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.nights_stay_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.format_size_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),*/
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ListView(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/users.png'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('$author, '),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        '6 Views',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        '1 Likes',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        '5 Saves',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(image),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: '',
                        style: GoogleFonts.notoSerif(
                            color: Colors.black, fontSize: 32)),
                    TextSpan(
                      text:
                          ' Programming is a skilled task; it can be stated art professionally to write a code with minimum memory utilization. It is not just a typing job. It involves knowledge and the sequential approach of development. Let us understand the program development life cycle. We need to consider the following steps: 1. Understand the Problem Programmers have to know about the user’s requirements before typing anything because a program or software is going to be used by that user or users. First, we need to think about what kind of output has to produce. Then we can plan for what kind of inputs will be required to generate the output. Some documentation can help in this, such as original requests for the program from users, sample output, and descriptions of the data items available for input. Still the Understanding the problem is a challenging task. 2. Prepare the Logic Preparing the logic is the prime activity of the program development cycle. Its prerequisite is to have analytical skills. Whatever information is gathered from the user, we need to analyze it and prepare a scenario. Here we have to start planning the steps for writing the code and finalize the sequence of the steps. For this, we can use flowcharts or pseudocode. Planning a program is also referred to as “developing an algorithm’ An algorithm is the sequence of steps or rules we follow to solve a problem. In this step, the programmer needs to think carefully about all the possible data values a Program might encounter and how we want the program to handle each scenario. 3. Write a Code In this step, first, we need to decide which programming language to be used. Despite their differences, programming languages are quite similar in their basic capabilities. After choosing a language, the programmer must be concerned about using the correct syntax. 4. Use Software (a compiler or interpreter) Programming languages use human-understandable language such as English. After writing code, it needs to be converted in machine language as the computer knows only machine language, which consists of Is and Os. To achieve this, we use a translator program (a compiler or interpreter) that converts high-level programming language into the low-level machine language that the computer understands. This software also helps programmers by notifying for incorrect syntax, which is referred to as error messages. 5. Test the Program Sometimes an error-free program may have logical errors. A logical error results after using a syntactic correct statement; however, use the incorrect one for this context. So the programmer has to execute the program and provide some sample data to see whether the results are logically correct. The process of finding and correcting program errors is called debugging. 6. Put the Program into Production Putting the program into production is simply executing the program to make sure that it is working as per the requirement. Users also to be trained to understand that how to use the program to generate output. 7. Maintain the Program. After programs square measure place into production, creating necessary changes is termed maintenance. Changes may occur because of changes in government rule for taxes or maybe as per the user’s requirement.',
                      style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontSize: 18,
                        height: 1.7,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
