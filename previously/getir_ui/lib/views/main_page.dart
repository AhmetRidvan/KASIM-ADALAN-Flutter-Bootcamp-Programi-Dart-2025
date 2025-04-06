import 'package:flutter/material.dart';
import 'package:getir_ui/model/product.dart';

class Getir extends StatefulWidget {
  Getir({super.key});

  @override
  State<StatefulWidget> createState() {
    return _getir();
  }
}

class _getir extends State<Getir> {
  var products = <ProductModel>[
    ProductModel(title: 'elma', url: '1.png'),
    ProductModel(title: 'armut', url: '2.png'),
    ProductModel(title: 'çilek', url: '3.png'),
    ProductModel(title: 'börtlen', url: '4.png'),
    ProductModel(title: 'pörtü', url: '5.png'),
    ProductModel(title: 'böcek', url: '6.png'),
    ProductModel(title: 'ev', url: '7.png'),
    ProductModel(title: 'masa', url: '8.png'),
    ProductModel(title: 'fare', url: '9.png'),
    ProductModel(title: 'klavye', url: '10.png'),
    ProductModel(title: 'keyboard', url: '11.png'),
    ProductModel(title: 'monütör', url: '12.png'),
    ProductModel(title: 'kulaklık', url: '13.png'),
    ProductModel(title: 'ilaç', url: '14.png'),
    ProductModel(title: 'kolonya', url: '15.png'),
  ];

  Widget grid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 3 / 4,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Image.asset(
                  'images/${products[index].url}',
                  height: 77,
                  width: 77,
                ),
                Text(products[index].title),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
              child: Icon(Icons.home, color: Colors.yellow),
              width: 40,

              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple,
              ),
            ),
            icon: Icon(Icons.home, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_option_key, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: '',
          ),
        ],
      ),
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
                Expanded(child: Image.asset('images/pngwing.com.png'), flex: 1),
                SizedBox(width: 5),
                Expanded(
                  flex: 5,
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
                            "Esenyurt talatpaşa mah",

                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.chevron_right_sharp),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Image.asset('images/pngwing.com (1).png'),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tvs",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xff2b17e3)),
                              ),
                              Text(
                                "20dk",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2b17e3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/pngwing.com (2).png'),
            SizedBox(width: 1000, height: 1000, child: grid()),
          ],
        ),
      ),
    );
  }
}
