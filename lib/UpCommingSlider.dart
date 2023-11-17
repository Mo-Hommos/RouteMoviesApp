import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/api/detailsScreen/DetailsScreen.dart';
import 'api/apiConst.dart';
import 'model/trendingMovies.dart';


class UpCommingSlider extends StatelessWidget {
  Future<List<trendingMovie>> upcomingData;
   UpCommingSlider({super.key,required this.upcomingData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: upcomingData, builder: (context, snapshot) {
      if(snapshot.hasData){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("New Release",style: GoogleFonts.aBeeZee(color: Colors.white),),
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
                        "${Constants.imageBaseUrl}${movies?.posterPath}"
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
      }else if(snapshot.hasError){
        return Text(snapshot.error.toString());
      }else{
        return Center(child: CircularProgressIndicator());
      }
    },);
  }
}

// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text("Recomended",style: GoogleFonts.aBeeZee(color: Colors.white),),
// ),
// Container(
// height: 200,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Color(0xFF282A28)
// ),
// child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Stack(
// alignment: Alignment.topLeft,
// children: [
// Container(
// height: 200,
// width: 130,
// decoration: BoxDecoration(
// color: Colors.lime
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(4.0),
// child: Icon(Icons.bookmark),
// )
// ],
// ),
// );
// },itemCount: 10,),
// ),
// ],
// )
