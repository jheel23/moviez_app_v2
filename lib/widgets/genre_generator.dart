import 'package:flutter/material.dart';
import 'package:moviez_app/model/movie.dart';

Wrap genreGenretor(BuildContext context, Movie movieDetails,
    {bool all = false, double size = 15}) {
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    alignment: WrapAlignment.start,
    children: List.generate(
        movieDetails.genres.length,
        (index) => all
            ? Text(
                '${movieDetails.genres[index]} . ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size,
                ),
              )
            : Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  movieDetails.genres[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                ),
              )),
  );
}
