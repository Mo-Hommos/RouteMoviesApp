import 'package:flutter/material.dart';
import 'package:untitled/HomeTap.dart';
import 'package:untitled/Search/SearchTap.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int iconindex = 0;
  List<Widget> taps = [
    HomeTap(),
    SearchTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            iconindex = index;
          });
        },
        currentIndex: iconindex,
        items: [
          BottomNavigationBarItem(backgroundColor: Color(0xFF1A1A1A),icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(backgroundColor: Color(0xFF1A1A1A),icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(backgroundColor: Color(0xFF1A1A1A),icon: Icon(Icons.browse_gallery),label: "Browse"),
          BottomNavigationBarItem(backgroundColor: Color(0xFF1A1A1A),icon: Icon(Icons.check_box_rounded),label: "Watch list"),
        ],
      ),
      body: taps[iconindex],

    );
  }
}
