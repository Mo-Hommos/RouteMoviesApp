import 'package:flutter/material.dart';
import 'package:untitled/api/apiConst.dart';
import 'package:untitled/api/detailsScreen/SimilarMoviesSlider.dart';
import 'package:untitled/model/trendingMovies.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  static const routename = "detailsScreen";
   DetailsScreen({super.key,required this.movie});
   final trendingMovie? movie;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(widget.movie!.title,style : GoogleFonts.aBeeZee(color: Colors.white,fontSize: 20)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assest/img/685983d002c54c0.jpg");
                        },
                        "${Constants.imageBaseUrl}${widget.movie?.backDropPath ?? widget.movie?.backdrop_path}"
                    ),
                  ),
                  InkWell(child: Icon(Icons.play_circle,size: 50,color: Colors.white60)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie!.title,
                    style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 14) ,
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.movie?.releaseDate ?? widget.movie?.release_date ?? "21/2/2004",
                    style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 10) ,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 150,
                              width: 100,
                              child: Image.network(
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset("assest/img/default-movie-768x1129.jpg");
                                  },
                                  "${Constants.imageBaseUrl}${widget.movie?.posterPath ?? widget.movie?.poster_path}"),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: widget.movie),));
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              width: 200,
                              child: SingleChildScrollView(child: Text(widget.movie!.overview,style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 10),)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star,color: Colors.amber,size: 14,),
                                Text(widget.movie!.voteAverage.toString(),style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 18))
                              ],
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SimilarMoviesSlider(id: widget.movie!.id),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
