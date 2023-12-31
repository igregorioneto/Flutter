import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reader_ebooks/features/home/home_screen.dart';
import 'package:reader_ebooks/services/book_service.dart';
import 'package:reader_ebooks/utils/menu_nav_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reader E-Books',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
