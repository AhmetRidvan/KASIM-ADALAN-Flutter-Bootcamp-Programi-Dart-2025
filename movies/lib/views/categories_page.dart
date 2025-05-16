import 'package:flutter/material.dart';
import 'package:movies/models/category_model.dart';
import 'package:movies/views/movies_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  Future<List<CategoryModel>> bringItAll() async {
    final list = <CategoryModel>[];
    var o1 = CategoryModel(category_id: 1, category_name: 'Comedy');
    var o2 = CategoryModel(category_id: 3, category_name: 'Horror');

    list.addAll([o1, o2]);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories'), centerTitle: true),
      body: FutureBuilder(
        future: bringItAll(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final x = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return MoviesPage(categoryModel: x,);
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(x.category_name)],
                      ),
                    ),
                  ),
                );
              },
              itemCount: data!.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
