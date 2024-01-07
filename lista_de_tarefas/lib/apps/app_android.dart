import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/home_page_android.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.purple,
          secondary: Colors.blue,
        ),
        scaffoldBackgroundColor: Colors.green.shade100,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(fontStyle: FontStyle.italic, color: Colors.purple.shade400),
        ),
      ),
      home: HomePage(),
    );
  }
}
