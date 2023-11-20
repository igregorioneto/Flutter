import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader_ebooks/models/books.dart';
import 'package:reader_ebooks/services/book_service.dart';

class BooksScreen extends StatelessWidget {
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
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _bookCard(context, snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}

Widget _bookCard(BuildContext context, Book book) {
  return Card(
    margin: EdgeInsets.all(8.0),
    child: ListTile(
      leading: _bookImageCover(book.coverUrl),
      title: Text(book.title),
      subtitle: Text(book.author),
      trailing: _bookFavorite(book.id),
    ),
  );
}

Widget _bookImageCover(String coverUrl) {
  return Image.asset(
    coverUrl,
    width: 50,
    height: 80,
    fit: BoxFit.cover,
  );
}

Widget _bookFavorite(int id) {
  return IconButton(
    icon: Icon(Icons.bookmark),
    onPressed: () {
      print(id);
    },
  );
}
