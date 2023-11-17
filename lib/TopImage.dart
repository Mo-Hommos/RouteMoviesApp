import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'api/apiConst.dart';
class TopImage extends StatelessWidget {
  String title;
  String? backDropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  int id;
  TopImage(
      {
        required this.title,
        required this.voteAverage,
        required this.releaseDate,required this.posterPath,
        required this.overview,
        required this.originalTitle,
        required this.backDropPath,
        required this.id
      }
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 217,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 75),
                  child: Stack(
                    alignment: Alignment.center,
                     children: [
                       SizedBox(
                         width: double.infinity,
                         height: MediaQuery.of(context).size.height,
                         child: Image.network(
                           filterQuality: FilterQuality.high,
                         fit: BoxFit.fill,
                         "${Constants.imageBaseUrl}${backDropPath}"
                         ),
                       ),
                       InkWell(child: Icon(Icons.play_circle,size: 50,color: Colors.white60)),
                     ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 199,
                    width: 129,
                    margin: EdgeInsets.only(left: 21),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                      SizedBox(
                      width: 130,
                      height: 200,
                      child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                          "${Constants.imageBaseUrl}${posterPath}"
                      ),
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
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${title}",
                          style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 14) ,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "${releaseDate}",
                          style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 10) ,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
