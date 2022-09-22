// ignore_for_file: prefer_const_constructors

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/functions/common_functions.dart';
import 'package:movie_hub/layout_constant/constant.dart';
import 'package:movie_hub/screens/moviedescription/moviedescription.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TopRatedTvShow extends StatelessWidget {
  final List TopRatedTvShowList;
  const TopRatedTvShow({Key? key, required this.TopRatedTvShowList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print("///");
    print(TopRatedTvShowList);
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
              text: "Top Rated Tv Shows", color: Colors.black, size: 20),
        ),
        Container(
         height: screenHeight*.35,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // physics:NeverScrollableScrollPhysics(),
              itemCount: TopRatedTvShowList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(),
                      child: Column(
                        
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                
                                     onTap: () { 
                                print("d");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDescription()
                                  ));
                              },
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'http://image.tmdb.org/t/p/w500' +
                                                  TopRatedTvShowList[index]
                                                      ['backdrop_path']),
                                          fit: BoxFit.fill)),
                                  height:
                                      MediaQuery.of(context).size.height * .23,
                                  width: 250,
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
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 150,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  TopRatedTvShowList[index]['original_name'],
                                  
                                  maxLines: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      //fontFamily: GoogleFonts.roboto,
                                      fontSize: 13),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: text_template(
                                  text:
                                      "Language : ${TopRatedTvShowList[index]['original_language']}",
                                  color: Colors.black,
                                  size: 12),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: text_template(
                                  text:
                                      "Release Date : ${TopRatedTvShowList[index]['release_date']}",
                                  color: Colors.black,
                                  size: 12),
                            ),
                           
                          ]),
                    )
                  ],
                );
              }),
        )
      ],
    );
  }
}
