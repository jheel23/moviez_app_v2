class Movie {
  final String moviePoster;
  final String movieTitle;
  final String movieOverview;
  final String movieReleaseDate;
  final double movieRating;
  final int movieId;
  final List<String> genres;
  final String originCountry;

  Movie({
    required this.moviePoster,
    required this.movieTitle,
    required this.movieOverview,
    required this.movieReleaseDate,
    required this.movieRating,
    required this.movieId,
    required this.genres,
    required this.originCountry,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      moviePoster: json['image'] == null
          ? 'https://picsum.photos/200/300'
          : json['image']['original'] ?? '',
      movieTitle: json['name'] ?? '',
      movieOverview: json['summary'] ?? '',
      movieReleaseDate: json['premiered'] ?? '',
      movieRating: json['rating']['average'] == null
          ? 0.0
          : json['rating']['average'].toDouble(),
      movieId: json['id'] ?? 0,
      genres: List<String>.from(json['genres']),
      originCountry: json['network'] == null
          ? 'N/A'
          : json['network']['country']['name'] ?? '',
    );
  }

  factory Movie.initialState() {
    return Movie(
      moviePoster: '',
      movieTitle: '',
      movieOverview: '',
      movieReleaseDate: '',
      movieRating: 0.0,
      movieId: 0,
      genres: [],
      originCountry: '',
    );
  }
}
