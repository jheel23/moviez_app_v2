// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:http/http.dart' as http;

class AllMoviesNotifier extends StateNotifier<List<Movie>> {
  AllMoviesNotifier() : super([]);
  final List<Movie> _allMovie = [];
  Movie findById(int id) {
    return _allMovie.firstWhere((element) => element.movieId == id);
  }

  Future<void> allMovies() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData.isEmpty) {
        return;
      }
      _allMovie.clear();
      await for (var element in Stream.fromIterable(extractedData)) {
        _allMovie.add(Movie.fromJson(element['show']));
      }
      state = _allMovie;
    } catch (e) {
      rethrow;
    }
  }
}

final allMoviesProvider = StateNotifierProvider<AllMoviesNotifier, List<Movie>>(
    (ref) => AllMoviesNotifier());
