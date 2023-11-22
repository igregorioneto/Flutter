import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader_ebooks/models/books.dart';
import 'package:reader_ebooks/services/book_service.dart';
import 'package:reader_ebooks/widgets/book_card.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookService = Provider.of<BookService>(context, listen: false);

    return FutureBuilder<List<Book>>(
      future: bookService.fetchBooks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar informações ${snapshot.error}');
        } else {
          var favoriteBooks = bookService.favoriteBooks;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: favoriteBooks.length,
            itemBuilder: (context, index) {
              return bookCard(context, favoriteBooks[index], bookService);
            },
          );
        }
      },
    );
  }
}
