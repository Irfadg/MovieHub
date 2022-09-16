
// ignore_for_file: prefer_const_constructors

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/functions/common_functions.dart';
import 'package:movie_hub/layout_constant/constant.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TopRatedMovieWidget extends StatelessWidget {
  final List TopRatedMovie;
  const TopRatedMovieWidget({Key? key, required this.TopRatedMovie})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
      
        Padding(
          padding: const EdgeInsets.all(5),
          child: text_template(
              text: "Top Rated Movies", color: Colors.white, size: 20),
        ),
        Container(
       height: 220,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // physics:NeverScrollableScrollPhysics(),
              itemCount: TopRatedMovie.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
              
                      shape: RoundedRectangleBorder(
                       
                      ),
                      child: Column(
                       
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
                                    
                                        image: DecorationImage(image:NetworkImage('http://image.tmdb.org/t/p/w500'+TopRatedMovie[index]['poster_path']),
                                  fit: BoxFit.fill)),
                                    height:
                                        MediaQuery.of(context).size.height * .2,
                                    width: 100,
                                    
                                
                                        
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
                        
                        
                        ],
                      ),
                    ),
                      SizedBox(
                        height: 5,
                      ),
                  Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                            Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(TopRatedMovie[index]['original_title'],
                      maxLines: 1,
  overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        //fontFamily: GoogleFonts.roboto,
                        fontSize: 13
                      ),
                      )
                      // text_template(
                        
                      //   text: trendingMovieList[index]['original_title'], color: Colors.black, size: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: text_template(text: "Language : ${TopRatedMovie[index]['original_language']}", color: Colors.white, size: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: text_template(text: "Release Date : ${TopRatedMovie[index]['release_date']}", color: Colors.white, size: 12),
                    ),
                      ]
                    ),
                  )

                  ],
                );
              }),
        )
      ],
    );
  }
}