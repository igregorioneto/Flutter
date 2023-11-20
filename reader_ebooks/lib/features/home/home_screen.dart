import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_ebooks/features/books/books_screen.dart';
import 'package:reader_ebooks/utils/menu_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leitor de eBooks'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MenuNavBar(),
            ),
          );
        },
        child: Center(
          child: _buildWelcomeMessage(),
        ),
      ),
    );
  }
}

Widget _buildWelcomeMessage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Bem vindo ao',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Text(
        'Leitor de eBooks',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Text(
        'Clique na tela para começar a ler excelentes livros!',
        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
      ),
    ],
  );
}
