import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quick_daktar/Screen/ChatPage/chatPage.dart';
import 'package:quick_daktar/Screen/FeedPage/feedPage.dart';
import 'package:quick_daktar/Screen/HomePage/homePage.dart';
import 'package:quick_daktar/Screen/NotificationPage/notificationPage.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int bottomNavIndex = 0;

  final List<Widget> children = [
    HomePage(),
    FeedPage(),
    //StorePage(),
    ChatPage(),
    NotificationPage(),
  ];
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the BottomNavigationBar
            // canvasColor: Colors.teal,
            //backgroundColor: Colors.lightBlue,
            // sets the active color of the BottomNavigationBar if Brightness is light
            //primaryColor: Colors.greenAccent[400]
            //disabledColor: Colors.blue,
            // textTheme: Theme
            //     .of(context)
            //     .textTheme
            //     .copyWith(caption: new TextStyle(color: Colors.white54))
            ),
        child:  CurvedNavigationBar(
          index: _currentIndex,
          animationCurve: Curves.ease,
          height: 65,
          animationDuration: Duration(milliseconds: 900),
          backgroundColor: Colors.white.withOpacity(0),
          buttonBackgroundColor: Colors.blue[300],
          color: Colors.blue[300],
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white,),
            Icon(Icons.web, size: 30, color: Colors.white),
            Icon(Icons.chat_bubble_outline,size: 30, color: Colors.white),
            Icon(Icons.notifications, size: 30, color: Colors.white),
          ],
          onTap: onTabTapped,
        ),
          ),
        );
      }


  void onTabTapped(bottomNavIndex) {
    setState(() {
      _currentIndex = bottomNavIndex;
    });
  }
}