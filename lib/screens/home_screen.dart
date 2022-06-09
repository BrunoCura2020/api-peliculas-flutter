import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widget.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text('Drawer Header'),
              ),
            ),
            ListTile(
              title: const Text('Televisor'),
              onTap: () {
                Navigator.of(context).pop(context); //Cierro el drawer
                Navigator.of(context).pushNamed('television');
              },
            ),
            ListTile(
              title: const Text('Temporadas de televisión'),
              onTap: () {
                Navigator.of(context).pop(context);
              },
            ),
            ListTile(
              title: const Text('Episodios de televisión'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Grupos de Episodios de TV'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //tarjetas
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //Slider de pelicula
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
