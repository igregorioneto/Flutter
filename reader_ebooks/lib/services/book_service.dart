import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:reader_ebooks/models/books.dart';

class BookService extends ChangeNotifier {
  final http.Client httpClient = http.Client();

  List<Book> _books = [];
  List<int> _favorites = [];

  List<Book> get books => _books;
  List<Book> get favoriteBooks =>
      _books.where((book) => _favorites.contains(book.id)).toList();

  Future<List<Book>> fetchBooks() async {
      var url = Uri.https('escribo.com', '/books.json');

      var response = await httpClient.get(url);
      
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as List<dynamic>;

        List<Book> books = jsonResponse.map((dynamic book) {
            return Book(
              id: book['id'] ?? '',
              title: book['title'] ?? '',
              author: book['author'] ?? '',
              coverUrl: book['cover_url'] ?? '',
              downloadUrl: book['download_url'] ?? '',
            );
        }).toList();

        notifyListeners();
        return books;
      } else {
        throw Exception('Falha ao carregar a lista de livros...');
      }
  }

  bool isFavorite(int id) {
    return _favorites.contains(id);
  }

  void toggleFavorite(int id) {
    var wasFavorite = _favorites.contains(id);
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }


    var isFavorite = _favorites.contains(id);
    if (wasFavorite != isFavorite) {
      notifyListeners();
    }
  }

  void dispose() {
    httpClient.close();
    super.dispose();
  }
}