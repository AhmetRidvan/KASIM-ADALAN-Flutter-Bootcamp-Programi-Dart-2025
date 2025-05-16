import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.movieModel});

  MovieModel movieModel;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final m1 = widget.movieModel;
    return Scaffold(
      appBar: AppBar(title: Text(m1.movie_name), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/${m1.movie_image}'),
            Text(m1.movie_year.toString(), style: TextStyle(fontSize: 30)),
            Text(
              m1.directorModel.director_name,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
