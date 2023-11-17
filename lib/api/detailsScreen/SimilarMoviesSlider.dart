import 'package:flutter/material.dart';
import 'package:untitled/api/apimanger.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/model/trendingMovies.dart';
import '../apiConst.dart';
import 'DetailsScreen.dart';

class SimilarMoviesSlider extends StatefulWidget {
  int id;
  SimilarMoviesSlider({required this.id});

  @override
  State<SimilarMoviesSlider> createState() => _SimilarMoviesSliderState();
}

class _SimilarMoviesSliderState extends State<SimilarMoviesSlider> {
  late Future<List<trendingMovie>> SimilarData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SimilarData = apiManger().getSimilarMovies(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SimilarData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("More Like This",style: GoogleFonts.aBeeZee(color: Colors.white),),
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF282A28)
                ),
                child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                  trendingMovie? movies = snapshot.data?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        GestureDetector(
                          child: Image.network(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset("assest/img/default-movie-768x1129.jpg");
                              },
                              "${Constants.imageBaseUrl}${movies?.poster_path ?? movies?.posterPath}",
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: movies),));
                          },
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(Icons.bookmark,size: 30,color: Color(0xBB514F4F)),
                            Icon(Icons.add,size: 13,color: Colors.white)
                          ],
                        )
                      ],
                    ),
                  );
                },itemCount: snapshot.data!.length,),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          if (snapshot.error != null && snapshot.error is String) {
            // If the error is a non-null String, display it
            return Text(snapshot.error.toString());
          } else {
            // Handle other types of errors or display a generic error message
            return Text('An error occurred');
          }
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
