import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:http/http.dart' as http;

class SearchNotifier extends StateNotifier<List<Movie>> {
  SearchNotifier() : super([]);
  List<Movie> searchMovie = [];

  void clearList() {
    searchMovie.clear();
    state = searchMovie;
  }

  Movie findById(int id) {
    return searchMovie.firstWhere((element) => element.movieId == id);
  }

  Future<void> searchMovies(String query) async {
    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData.isEmpty) {
        return;
      }
      searchMovie.clear();
      await for (var element in Stream.fromIterable(extractedData)) {
        searchMovie.add(Movie.fromJson(element['show']));
      }
      state = searchMovie;
    } catch (e) {
      log('Error in Search API: $e');
    }
  }
}

final searchProvider = StateNotifierProvider<SearchNotifier, List<Movie>>(
    (ref) => SearchNotifier());
