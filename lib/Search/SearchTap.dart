import 'package:flutter/material.dart';
import 'package:untitled/api/apimanger.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api/apiConst.dart';
import '../api/detailsScreen/DetailsScreen.dart';
import '../model/trendingMovies.dart';

class SearchTap extends StatefulWidget {
  const SearchTap({super.key});

  @override
  State<SearchTap> createState() => _SearchTapState();
}

class _SearchTapState extends State<SearchTap> {
   String quary = '';
   late Future<List<trendingMovie>> SimilarData;
   void initState() {
     // TODO: implement initState
     SimilarData  = apiManger().getSearchMovies(quary);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                quary = value;
                setState(() {
                  SimilarData = apiManger().getSearchMovies(value);
                });
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff514F4F),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                  hintText: "eg : the dark knight",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white
              ),
            ),
            SizedBox(height: 20,),
            Expanded(child: FutureBuilder(future: SimilarData, builder: (context, snapshot) {
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
                                    SizedBox(height: 5,),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        movies?.releaseDate ?? "PlaceHolder",
                                        style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 14) ,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
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
                return Center(child: CircularProgressIndicator());
              }
            },))
          ],
        ),
      ),
    );
  }
}
///snapshot.data!.length
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: 200,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Color(0xFF282A28)
// ),
// child: ListView.builder(scrollDirection: Axis.vertical,itemBuilder: (context, index) {
// trendingMovie? movies = snapshot.data?[index];
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Stack(
// alignment: Alignment.topLeft,
// children: [
// GestureDetector(
// child: Image.network(
// filterQuality: FilterQuality.high,
// fit: BoxFit.fill,
// "${Constants.imageBaseUrl}${movies?.posterPath}"
// ),
// onTap: () {
// Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: movies),));
// },
// ),
// Stack(
// alignment: Alignment.center,
// children: [
// Icon(Icons.bookmark,size: 30,color: Color(0xBB514F4F)),
// Icon(Icons.add,size: 13,color: Colors.white)
// ],
// )
// ],
// ),
// );
// },itemCount: snapshot.data!.length,),
// ),
// ],
// )