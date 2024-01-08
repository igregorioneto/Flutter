import 'dart:convert';

import 'package:movie_list/domain/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_list/domain/models/movie_data.dart';

class MovieService {
  static const key = '';

  Future<List<Movie>> getMovies({int page = 1}) async {
    var url = Uri.parse('');
    final response = await http.post(url);
    final json = jsonDecode(response.body);
    return MovieData.fromJson(json).movies;
  }
}