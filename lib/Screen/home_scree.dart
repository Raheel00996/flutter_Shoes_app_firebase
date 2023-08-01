import 'package:flutter/material.dart';
import 'package:ui/Modal/constant.dart';
import 'Display_Screen.dart';
import 'Main_Display.dart';
import '../Profile_data/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final pages = [test2(), data(), const Profile_Screen()];
  var cindex = 0;
  // int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Image(
            image: AssetImage('assets/logo.png'),
            width: 166,
          ),
        ),
        elevation: 1000,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.segment_rounded,
          color: Colors.black,
        ),
        actions: const [
          Icon(
            Icons.search_sharp,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite_outline_rounded,
            color: Colors.black,
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 25,
            color: cindex == 0 ? wht : grecolor,
          ),
          Icon(Icons.shopping_bag_outlined,
              size: 25, color: cindex == 1 ? wht : grecolor),
          Icon(Icons.bookmark_border_rounded,
              size: 25, color: cindex == 2 ? wht : grecolor),
          Icon(Icons.notifications_active_outlined,
              size: 25, color: cindex == 3 ? wht : grecolor),
          Icon(Icons.person_rounded,
              size: 25, color: cindex == 4 ? wht : grecolor),
        ],
        color: Colors.white,
        buttonBackgroundColor: color1,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            cindex = index;
          });
        },
      ),
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: pages[cindex],
    );
  }
}
