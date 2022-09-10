// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:movie_hub/layout_constant/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: screenHeight * .1,
            width: screenWidth,
            color: Colors.black,
// decoration: const BoxDecoration(
//               color: kPrimaryColor,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30)),
//             ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: new Image.asset(
                      'assets/images/plexStreamIcon.png',
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                  TextButton(onPressed: () {}, child: Text("Search")),
                  TextButton(onPressed: () {}, child: Text("Favourite"))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 141, 13, 13),
            ),
          )
        ],
        
      )),
    );
  }
}
