import 'package:flutter/material.dart';
import 'package:untitled/CategoryScreen.dart';
import 'package:untitled/api/apimanger.dart';
import 'package:untitled/model/genres.dart';
import 'package:google_fonts/google_fonts.dart';

import 'api/apiConst.dart';

class CategoryTap extends StatefulWidget {

  @override
  State<CategoryTap> createState() => _CategoryTapState();
}

class _CategoryTapState extends State<CategoryTap> {
  late Future<List<genres>> generesdata;
  @override
  void initState() {
    generesdata = apiManger().getgenera();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Browse Category",style: GoogleFonts.aBeeZee(color: Colors.white),),
      FutureBuilder(future: generesdata, builder: (context, snapshot) {
        if(snapshot.hasData){
          return Container(
            width: 360,
            height: 520,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 2.0,
            ), itemBuilder: (context, index) {
              genres? generas = snapshot.data?[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(name: generas.id.toString()),));
                    },
                    child: Container(
                      color: Color(Constants.colors[index]),
                      width: 160,
                      height: 130,
                      child: Center(child: Text(generas!.name,style: GoogleFonts.aBeeZee(color: Colors.black),)),
                    ),
                  ),
                ],
              );
            },itemCount: snapshot.data!.length,),
          );
        }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },),
        ],
      ),
    );
  }
}

///snapshot.data!.length