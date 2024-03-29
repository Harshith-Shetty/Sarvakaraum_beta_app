import 'package:sarvakaraum/screens/blog/screens/post_details_page.dart';
import 'package:sarvakaraum/screens/blog/widgets/post_cell_widget.dart';
import 'package:flutter/material.dart';

class Post {
  final String title;
  final String image;
  final String author;
  final String date;

  Post({this.title, this.image, this.author, this.date});
}

// ignore: camel_case_types
class Blogs_dash extends StatelessWidget {
  final data = [
    Post(
      image: 'assets/blogs/colors.png',
      title: 'What is Program Development Cycle?',
      author: 'Akshat Mehta',
      date: '25 Mar 2021',
    ),
    Post(
      image: 'assets/blogs/10_skill.png',
      title: '10 Skills Necessary for Coding',
      author: 'Harshith Shetty',
      date: '24 Mar 2021',
    ),
    Post(
      image: 'assets/blogs/os.png',
      title: 'Operating System and Computer System you need to know about',
      author: 'Rutuja Khumbhar',
      date: '10 Mar 2021',
    ),
    Post(
      image: 'assets/blogs/web_dev.png',
      title: 'How to become a Web Developer?',
      author: 'Aayush Joshi',
      date: '15 Mar 2021',
    ),
    Post(
      image: 'assets/blogs/what_is_c.png',
      title: 'What is C-Programming',
      author: 'Akshat Mehta',
      date: '11 Mar 2021',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sarvakaraum Blogs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/users.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 0,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      //bottomNavigationBar: BottomBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for articles, author, and tags',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your daily read',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final post = data[index];
                    return PostCellWidget(
                        title: post.title,
                        image: post.image,
                        author: post.author,
                        date: post.date,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PostDetailsPage(
                                title: post.title,
                                image: post.image,
                                author: post.author,
                                date: post.date,
                              ),
                            ),
                          );
                        });
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
                const SizedBox(
                  height: 20,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
