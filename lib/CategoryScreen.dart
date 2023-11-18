import 'package:flutter/material.dart';
import 'package:untitled/api/apimanger.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api/apiConst.dart';
import 'api/detailsScreen/DetailsScreen.dart';
import 'model/trendingMovies.dart';

class CategoryScreen extends StatefulWidget {
  String name;
  CategoryScreen({required this.name});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<trendingMovie>> CategoryMovieData;
  @override
  void initState() {
    // TODO: implement initState
    CategoryMovieData = apiManger().getCategouryMovies(widget.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body : Column(
      children: [
        Expanded(child: FutureBuilder(future: CategoryMovieData, builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(itemBuilder: (context, index) {
              trendingMovie? movies = snapshot.data?[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: movies),));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network(
                            "${Constants.imageBaseUrl}${movies?.posterPath}",
                            width: 90,
                            height: 110,
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset("assest/img/default-movie-768x1129.jpg",
                                height: 110,
                                width: 90,
                                fit: BoxFit.fill,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    movies?.title ?? "PlaceHolder",
                                    style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 14) ,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Container(
                                  width: 200,
                                  child: Text(
                                    movies?.releaseDate ?? "PlaceHolder",
                                    style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 9) ,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      color: Colors.white,
                    )
                  ],
                ),
              );
            },itemCount: snapshot.data!.length,);
          }else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },))
      ],
    ));
  }
}
