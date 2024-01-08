import 'package:flutter/material.dart';
import 'package:movie_list/domain/models/movie.dart';
import 'package:movie_list/viewmodel/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Filmes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<Movie>>(
        stream: viewModel.streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data!.length) {
                  final movie = snapshot.data![index];
                  return ListTile(
                    title: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      movie.overview,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Image.network(''),
                  );
                } else {
                  viewModel.getMovies();
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
