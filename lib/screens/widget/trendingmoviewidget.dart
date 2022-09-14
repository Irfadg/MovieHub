// ignore_for_file: prefer_const_constructors

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/functions/common_functions.dart';
import 'package:movie_hub/layout_constant/constant.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TrendingMovieWidget extends StatelessWidget {
  final List trendingMovieList;
  const TrendingMovieWidget({Key? key, required this.trendingMovieList})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(trendingMovieList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: text_template(
              text: "Trending Movies", color: Colors.black, size: 20),
        ),
        Container(
    height: 220,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // physics:NeverScrollableScrollPhysics(),
              itemCount: trendingMovieList.length,
              itemBuilder: (context, index) {
                return Card(
              
                  shape: RoundedRectangleBorder(
                   
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => 
                            //     )), 
                            child: Container(
                                decoration: BoxDecoration(
                                
                                    image: DecorationImage(image:NetworkImage('http://image.tmdb.org/t/p/w500'+trendingMovieList[index]['poster_path']),
                              fit: BoxFit.fill)),
                                height:
                                    MediaQuery.of(context).size.height * .23,
                                width: 150,
                                
                            
                                    
                                    ),
                          ),
                          Positioned(
                              right: 5,
                              top: 5,
                              child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Center(
                                            child: FavoriteButton(
                                              iconSize: 25,
                                              valueChanged: (_) {},
                                            ),
                                          ),
                                        )
                                  )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: text_template(text: trendingMovieList[index]['original_title'], color: Colors.black, size: 12),
                    ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
