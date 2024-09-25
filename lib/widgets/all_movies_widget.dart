import 'package:flutter/cupertino.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:moviez_app/widgets/custom/custom_movie_container.dart';

class AllMoviesWidget extends StatelessWidget {
  final List<Movie> allMovie;
  const AllMoviesWidget({Key? key, required this.allMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 20),
      itemBuilder: (context, index) => CustomMovieContainer(
        id: allMovie[index].movieId,
        image: allMovie[index].moviePoster,
        name: allMovie[index].movieTitle,
        identifier: 'movie',
      ),
    );
  }
}
