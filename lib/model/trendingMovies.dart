class trendingMovie{
  String title;
  String? backDropPath;
  String? originalTitle;
  String overview;
  String? posterPath;
  String? releaseDate;
  String? backdrop_path;
  String? original_title;
  String? poster_path;
  String? release_date;
  double voteAverage;
  double? vote_average;
  int id;
  trendingMovie(
      {
    required this.title,
    required this.voteAverage,
    required this.releaseDate,required this.posterPath,
    required this.overview,
    required this.originalTitle,
    required this.backDropPath,
    required this.id,
    required this.backdrop_path,
    required this.original_title,
    required this.poster_path,
    required this.release_date,
    required this.vote_average
  }
  );
  factory trendingMovie.fromJson(Map<String,dynamic> json){
    return trendingMovie(
        title: json["title"],
        voteAverage: json['vote_average'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        originalTitle: json['original_title'],
        backDropPath: json['backdrop_path'],
        id: json['id'],
        backdrop_path: json['backdrop_path'],
        original_title: json['original_title'],
        poster_path: json['poster_path'],
        release_date: json['release_date'],
        vote_average: json['vote_average']
    );
  }
}