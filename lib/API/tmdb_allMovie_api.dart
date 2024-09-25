// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:http/http.dart' as http;

class AllMoviesNotifier extends StateNotifier<List<Movie>> {
  AllMoviesNotifier() : super([]);
  final List<Movie> _allMovie = [];
  // final String apikey = '3571895bb749fe1cf693ee4870688dcf';
  // final readaccessToken =
  //     'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTcxODk1YmI3NDlmZTFjZjY5M2VlNDg3MDY4OGRjZiIsInN1YiI6IjY1MjNiZWE0MGNiMzM1MTZmNWM1YjY4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QNUjlq98Rw_-utZA_l1V8w8-VtyGbFoMAOlaedJtNrw';
  Movie findById(int id) {
    return _allMovie.firstWhere((element) => element.movieId == id);
  }

  Future<void> allMovies() async {
    try {
      // TMDB tmdbWithCustomLogs = TMDB(
      //   ApiKeys(apikey, readaccessToken),
      //   logConfig: const ConfigLogger(
      //     showLogs: true,
      //     showErrorLogs: true,
      //   ),
      // );
      // final response =
      //     await tmdbWithCustomLogs.v3.tv.getTopRated(language: 'en-US');
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData.isEmpty) {
        return;
      }
      await for (var element in Stream.fromIterable(extractedData)) {
        _allMovie.add(Movie.fromJson(element['show']));
      }
      state = _allMovie;
    } catch (e) {
      rethrow;
    }
  }
}

final allMoviesProvider =
    StateNotifierProvider<AllMoviesNotifier, List<Movie>>(
        (ref) => AllMoviesNotifier());
