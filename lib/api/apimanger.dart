import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/model/trendingMovies.dart';
class apiManger{
  Future<List<trendingMovie>> getTrendingMovies() async{
    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/movie/day?api_key=10cabead5f5640cf137393281d6b2e1f"));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<trendingMovie> list = [];
      for(var i = 0; i < data['results'].length ; i++){
        final entry = data['results'][i];
        list.add(trendingMovie.fromJson(entry));
      }
      return list;
    }
    else{
      throw Exception('HTTP Failed');
    }
  }
  Future<List<trendingMovie>> getUpcomingMovies() async{
    final response = await http.get(Uri.parse
      ("https://api.themoviedb.org/3/movie/upcoming?api_key=10cabead5f5640cf137393281d6b2e1f"));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<trendingMovie> list = [];
      for(var i = 0; i < data['results'].length ; i++){
        final entry = data['results'][i];
        list.add(trendingMovie.fromJson(entry));
      }
      return list;
    }
    else{
      throw Exception('HTTP Failed');
    }
  }
  Future<List<trendingMovie>> getSimilarMovies(int id) async{
    final response = await http.get(Uri.parse
      ("https://api.themoviedb.org/3/movie/${id}/similar?api_key=10cabead5f5640cf137393281d6b2e1f"));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<trendingMovie> list = [];
      for(var i = 0; i < data['results'].length ; i++){
        final entry = data['results'][i];
        list.add(trendingMovie.fromJson(entry));
      }
      return list;
    }
    else{
      throw Exception('HTTP Failed');
    }
  }
  Future<List<trendingMovie>> getTopRatedMovies() async{
    final response = await http.get(Uri.parse
      ("https://api.themoviedb.org/3/movie/top_rated?api_key=10cabead5f5640cf137393281d6b2e1f"));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<trendingMovie> list = [];
      for(var i = 0; i < data['results'].length ; i++){
        final entry = data['results'][i];
        list.add(trendingMovie.fromJson(entry));
      }
      return list;
    }
    else{
      throw Exception('HTTP Failed');
    }
  }

}