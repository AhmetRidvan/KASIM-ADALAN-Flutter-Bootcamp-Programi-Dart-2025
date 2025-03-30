import 'package:flutter/material.dart';

class Getir extends StatefulWidget {
  Getir({super.key});

  @override
  State<StatefulWidget> createState() {
    return _getir();
  }
}

class _getir extends State<Getir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/getir-seeklogo.png',
          height: 100,
          width: 100,
          color: Colors.amber,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            color: Colors.white,
            height: 50,
            child: Row(
              children: [
                Image.asset('images/pngwing.com.png'),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Row(
                        children: [
                          Text(
                            "Ev",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Esenyurt talatpaşa mah bişe sok",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.chevron_right_sharp),
                          Stack(
                            children: [
                              Image.asset('images/pngwing.com (1).png'),
                              Text(""),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
