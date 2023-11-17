import 'package:flutter/material.dart';
import 'package:untitled/TopImage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/api/detailsScreen/DetailsScreen.dart';
import 'model/trendingMovies.dart';

class TopSlider extends StatelessWidget {
  Future<List<trendingMovie>> trendingData;
  TopSlider({required this.trendingData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: trendingData, builder: (context,AsyncSnapshot snapshot) {
      if(snapshot.hasData){
        return CarouselSlider.builder(
          itemCount: snapshot.data!.length,
          options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(seconds: 1)
          ),
          itemBuilder: (context, index, realIndex) {
            trendingMovie movies = snapshot.data?[index];
            return Column(
              children: [
                GestureDetector(
                  child: TopImage(title: movies.title,
                      voteAverage: movies.voteAverage,
                      releaseDate: movies.releaseDate,
                      posterPath: movies.posterPath,
                      overview: movies.overview,
                      originalTitle: movies.originalTitle,
                      backDropPath: movies.backDropPath,
                      id: movies.id,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: movies),));
                  },
                ),
              ],
            );
          },
        );
      }else if(snapshot.hasError){
        return Text(snapshot.error.toString());
      }else{
        return Center(child: CircularProgressIndicator());
      }
    },);
  }
}
// CarouselSlider.builder(
// itemCount: 10,
// options: CarouselOptions(
// height: 300,
// autoPlay: true,
// viewportFraction: 1.0,
// enlargeCenterPage: true,
// pageSnapping: true,
// autoPlayCurve: Curves.fastOutSlowIn,
// autoPlayAnimationDuration: Duration(seconds: 1)
// ),
// itemBuilder: (context, index, realIndex) {
// return Column(
// children: [
// TopImage(),
// ],
// );
// },
// ),