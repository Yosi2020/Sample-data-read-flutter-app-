import 'package:debo_eyu/screens/Categories/categories_screen.dart';
import 'package:debo_eyu/screens/More/more_screens.dart';
import 'package:debo_eyu/screens/Remindes/remindes_screen.dart';
import 'package:debo_eyu/screens/Themes/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:debo_eyu/screens/View/view_Screen.dart';

class MyBottomBarDemo extends StatefulWidget {
  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<MyBottomBarDemo> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    CategoriesScreen(),
    ThemeScreen(),
    RemindesScreen(),
    MoreScreen(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallpaper),
              title: Text("Themes")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert_rounded),
              title: Text("Remindes")),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text("More")),
        ],

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 50),curve: Curves.easeInOut);
  }
}