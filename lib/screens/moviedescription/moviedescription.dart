// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_hub/layout_constant/constant.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blue,
                height:screenHeight*.25,
              ),
              Positioned(
                //top: ,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:  const Icon(
                Icons.arrow_back,
                          ),),
              ),
               Positioned(
                bottom: 0,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                             // ignore: prefer_const_literals_to_create_immutables
                             children: [
                               text_template(text: "Average Rating", color: Colors.white, size: 12),
                               text_template(text: "", color: Colors.white, size: 12)
               
                             ],
                           ),
                 ),
               ),
            ],
          ),
         
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: text_template(text: "Movie NAme", color: Colors.white, size: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: text_template(text: "Relaese date", color: Colors.white, size: 15),
          ),
        ],
      )
      )
    );
  }
}