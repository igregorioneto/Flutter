import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_ebooks/features/books/books_screen.dart';
import 'package:reader_ebooks/features/favorites/favorite_screen.dart';
import 'package:reader_ebooks/features/home/home_screen.dart';

class MenuNavBar extends StatefulWidget {
  @override
  State<MenuNavBar> createState() => _MenuNavBarState();
}

class _MenuNavBarState extends State<MenuNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var coloredScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = BooksScreen();
        break;
      case 1:
        page = FavoriteScreen();
        break;
      default:
        throw UnimplementedError('No Widget for $selectedIndex');
    }

    var mainArea = ColoredBox(
      color: coloredScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, contraints) {
          return Column(
            children: [
              Expanded(child: mainArea),
              SafeArea(
                child: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: 'Books',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorities',
                    ),
                  ],
                  currentIndex: selectedIndex,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
