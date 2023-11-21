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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
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
  return Padding(
    padding: EdgeInsets.only(bottom: 10.0),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: _bookImageCover(book.coverUrl),
              ),
              SizedBox(height: 8.0),
              Expanded(
                flex: 1,
                child: Text(
                  book.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 4.0),
              Expanded(
                flex: 1,
                child: Text(
                  book.author,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: _bookFavorite(book.id),
        ),
      ],
    ),
  );
}

Widget _bookImageCover(dynamic coverUrl) {
  return Image.network(
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
