import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:http/http.dart' as http;

class TmdbMovies extends StateNotifier<List<Movie>> {
  TmdbMovies() : super([]);
  List<Movie> movie = [];

  void initState() {
    trendingMovies();
  }

  Movie findById(int id) {
    return movie.firstWhere((element) => element.movieId == id);
  }

  Future<void> trendingMovies() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData.isEmpty) {
        return;
      }
      movie.clear();
      await for (var element in Stream.fromIterable(extractedData)) {
        movie.add(Movie.fromJson(element['show']));
      }
      state = movie;
    } catch (e) {
      rethrow;
    }
  }
}

final trendingMoviesProvider =
    StateNotifierProvider<TmdbMovies, List<Movie>>((ref) => TmdbMovies());
