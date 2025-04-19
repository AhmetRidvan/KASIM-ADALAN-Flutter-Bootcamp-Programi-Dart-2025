import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

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
  List<IconData> icons = [Icons.home, Icons.favorite];
  List<Widget> pages = [MainPage(), FavoritePage(), BasketPage()];
  int pageIndex = 0;
  TextEditingController t1 = TextEditingController();
  @override
  void dispose() {
    t1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          pageIndex == 0
              ? AppBar(
                toolbarHeight: 80,
                backgroundColor: Colors.pinkAccent,
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: t1,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(33),
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      labelText: "Search",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
              : null,
      body: pages[pageIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          setState(() {
            pageIndex = 2;
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
