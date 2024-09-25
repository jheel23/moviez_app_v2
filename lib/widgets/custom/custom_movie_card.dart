import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moviez_app/model/movie.dart';
import 'package:moviez_app/screens/movie_details_screen.dart';
import 'package:moviez_app/widgets/genre_generator.dart';

class CustomMovieCard extends StatelessWidget {
  final List<Movie> list;
  final int count;
  final String routeName;
  final String identifier;
  const CustomMovieCard(
      {Key? key,
      required this.list,
      required this.count,
      required this.routeName,
      required this.identifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MovieDetailsScreen.routeName,
                  arguments: {
                    'id': list[index].movieId,
                    'identifier': identifier
                  });
            },
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                height: deviceSize.height * 0.5,
                width: deviceSize.width * 0.9,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: deviceSize.height * 0.5,
                      width: deviceSize.width * 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          list[index].moviePoster,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 15,
                                sigmaY: 15,
                                tileMode: TileMode.clamp),
                            child: SizedBox(
                              height: deviceSize.height * 0.2,
                              width: deviceSize.width * 0.9,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                          Colors.black26,
                                          Colors.black26
                                        ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FittedBox(
                                      child: SizedBox(
                                        width: deviceSize.width * 0.7,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: deviceSize.width * 0.6,
                                              child: Text(
                                                list[index].movieTitle,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            genreGenretor(context, list[index],
                                                all: true),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                'Origin Country: ${list[index].originCountry}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -30,
                          right: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                height: 90,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(children: [
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Colors.black.withOpacity(0.3),
                                    child: const Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 14, 222, 35),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    list[index].movieRating.toStringAsFixed(1),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
