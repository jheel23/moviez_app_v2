import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:moviez_app/widgets/custom/custom_movie_container.dart';

class AllTrendingMoviesWidget extends StatelessWidget {
  final List<Movie> trendingMovie;
  const AllTrendingMoviesWidget({Key? key, required this.trendingMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => CustomMovieContainer(
        id: trendingMovie[index].movieId,
        image: trendingMovie[index].moviePoster,
        name: trendingMovie[index].movieTitle,
        identifier: 'trending',
      ),
    );
  }
}
