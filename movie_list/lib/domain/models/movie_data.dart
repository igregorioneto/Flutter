import 'package:movie_list/domain/models/movie.dart';

class MovieData {
  int page;
  List<Movie> movies;

  MovieData(this.page, this.movies);

  factory MovieData.fromJson(Map json) {
    final page = json['page'] as int;
    final results = json['results'] as List<dynamic>;

    final movies = results.map((e) => Movie.fromJson(e)).toList();

    return MovieData(page, movies);
  }
}