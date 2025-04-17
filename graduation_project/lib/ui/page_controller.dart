import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/ui/account_page.dart';
import 'package:graduation_project/ui/basket_page.dart';
import 'package:graduation_project/ui/favorite_page.dart';
import 'package:graduation_project/ui/main_page.dart';

class ControlOfPage extends StatefulWidget {
  const ControlOfPage({super.key});

  @override
  State<ControlOfPage> createState() {
    return ControlOfPageState();
  }
}

class ControlOfPageState extends State<ControlOfPage> {
  List<IconData> icons = [
    Icons.home,
    Icons.favorite,
    Icons.account_circle_rounded,
  ];
  List<Widget> pages = [
    MainPage(),
    FavoritePage(),
    AccountPage(),
    BasketPage(),
  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          setState(() {
            pageIndex = 3;
          });
        },
        child: Icon(Icons.shopping_basket_sharp, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.pinkAccent,
        gapLocation: GapLocation.end,
        icons: icons,
        activeIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
      ),
    );
  }
}
