import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez_app/API/tmdb_api.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:moviez_app/screens/movie_details_screen.dart';
import 'package:moviez_app/widgets/custom/custom_movie_card.dart';

class AllTrendingScreen extends ConsumerStatefulWidget {
  const AllTrendingScreen({super.key});
  static const routeName = '/all-trending';

  @override
  ConsumerState<AllTrendingScreen> createState() => _AllTrendingScreenState();
}

class _AllTrendingScreenState extends ConsumerState<AllTrendingScreen> {
  List<Movie> _alltrendingMovie = [];
  @override
  void initState() {
    _alltrendingMovie = ref.read(trendingMoviesProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title:
            const Text('All Trending', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: CustomMovieCard(
        list: _alltrendingMovie,
        count: _alltrendingMovie.length,
        routeName: MovieDetailsScreen.routeName,
        identifier: 'trending',
      ),
    );
  }
}
