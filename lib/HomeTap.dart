import 'package:flutter/material.dart';
import 'package:untitled/NewRelaseSlider.dart';
import 'package:untitled/UpCommingSlider.dart';
import 'package:untitled/api/apimanger.dart';
import 'package:untitled/topSlider.dart';
import 'model/trendingMovies.dart';

class HomeTap extends StatefulWidget {
   const HomeTap({Key? key}) : super(key: key);
  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late Future<List<trendingMovie>> trendingData;
  late Future<List<trendingMovie>> upcomingData;
  late Future<List<trendingMovie>> topRatedData;
  @override
  void initState() {
    super.initState();
    trendingData = apiManger().getTrendingMovies();
    upcomingData = apiManger().getUpcomingMovies();
    topRatedData = apiManger().getTopRatedMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            TopSlider(trendingData: trendingData,),
            UpCommingSlider(upcomingData: upcomingData,),
            SizedBox(height: 5,),
            NewRelaseSlider(topRatedData: topRatedData),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
