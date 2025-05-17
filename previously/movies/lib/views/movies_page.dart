import 'package:flutter/material.dart';
import 'package:movies/models/category_model.dart';
import 'package:movies/models/director_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/views/detail_page.dart';

class MoviesPage extends StatefulWidget {
  MoviesPage({super.key, required this.categoryModel});

  CategoryModel categoryModel;

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> bringAllTheMovies(int category_id) async {
    final moviesList = <MovieModel>[];

    CategoryModel c1 = CategoryModel(category_id: 1, category_name: 'Horror');
    DirectorModel d1 = DirectorModel(
      director_id: 2,
      director_name: 'Osman Sınav',
    );

    MovieModel m1 = MovieModel(
      movie_id: 1,
      movie_name: 'Love me',
      movie_year: 2009,
      movie_image: 'thepianist.png',
      categoryModel: c1,
      directorModel: d1,
    );

    MovieModel m2 = MovieModel(
      movie_id: 2,
      movie_name: "Don't go",
      movie_year: 2028,
      movie_image: 'thehatefuleight.png',
      categoryModel: c1,
      directorModel: d1,
    );
    MovieModel m3 = MovieModel(
      movie_id: 3,
      movie_name: "Who am i",
      movie_year: 2023,
      movie_image: 'inception.png',
      categoryModel: c1,
      directorModel: d1,
    );

    moviesList.addAll([m1, m2, m3]);

    return moviesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryModel.category_name}'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: bringAllTheMovies(widget.categoryModel.category_id),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.3,
              ),
              itemBuilder: (context, index) {
                final movie = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailPage(movieModel: movie);
                        },
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/${movie.movie_image}'),
                        ),
                        Text(
                          movie.movie_name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
    ;
  }
}
