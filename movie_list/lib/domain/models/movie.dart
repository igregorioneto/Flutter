class Movie {
  String title;
  String overview;
  String backdropPath;

  Movie.fromJson(Map json)
      : title = json['title'],
        overview = json['overview'],
        backdropPath = json['backdrop_path'];
}
