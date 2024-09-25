import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez_app/API/tvmaze_allMovie_api.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:moviez_app/screens/movie_details_screen.dart';
import 'package:moviez_app/widgets/custom/custom_movie_card.dart';

class AllMoviesTvScreen extends ConsumerStatefulWidget {
  const AllMoviesTvScreen({super.key});
  static const routeName = '/all-tv-movies';

  @override
  ConsumerState<AllMoviesTvScreen> createState() => _AllMoviesTvScreenState();
}

class _AllMoviesTvScreenState extends ConsumerState<AllMoviesTvScreen> {
  List<Movie> _allMovieTVshows = [];
  @override
  void initState() {
    _allMovieTVshows = ref.read(allMoviesProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: const Text('All Movie & TV Shows',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: CustomMovieCard(
        list: _allMovieTVshows,
        count: _allMovieTVshows.length,
        routeName: MovieDetailsScreen.routeName,
        identifier: 'movie',
      ),
    );
  }
}
