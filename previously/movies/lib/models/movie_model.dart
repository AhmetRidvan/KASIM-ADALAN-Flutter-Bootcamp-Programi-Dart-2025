import 'package:movies/models/category_model.dart';
import 'package:movies/models/director_model.dart';

class MovieModel {
  int movie_id;
  String movie_name;
  int movie_year;
  String movie_image;
  CategoryModel categoryModel;
  DirectorModel directorModel;

  MovieModel({
    required this.movie_id,
    required this.movie_name,
    required this.movie_year,
    required this.movie_image,
    required this.categoryModel,
    required this.directorModel,
  });
}
//composition bir nesne'de başka bir nesnenin olması.