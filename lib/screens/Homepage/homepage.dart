// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:movie_hub/functions/common_functions.dart';
import 'package:movie_hub/screens/widget/trendingmoviewidget.dart';
import 'package:tmdb_api/tmdb_api.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
  void initState() {
        loadingMovieData();
    // TODO: implement initState
    super.initState();
  }
  //list varibles
  List trendingMovies = [];
  List getTopRatedTvShowList = [];
  List getTopRatedMovieList = [];
  loadingMovieData() async {
    final tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccesesToken),
      logConfig: const ConfigLogger(
        //must be true than only all other logs will be shown
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map getPopularMovie = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map getTopRatedTvShow = await tmdbWithCustomLogs.v3.tv.getTopRated();
    Map getTopRatedMovie = await tmdbWithCustomLogs.v3.movies.getTopRated();
    setState(() {
      trendingMovies = getPopularMovie['results'];
      getTopRatedMovieList = getTopRatedMovie['results'];
      getTopRatedTvShowList = getTopRatedTvShow['results'];
    });
 
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                  children: [
            Container(
              height: screenHeight * .1,
              width: screenWidth,
              decoration: const BoxDecoration(
                //color: Colors.transparent,
                 color: Color.fromARGB(255, 206, 45, 45),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    new Image.asset(
                      'assets/images/movie_club-removebg-preview.png',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    TextButton(
                        onPressed: () {},
                        // ignore: prefer_const_constructors
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
                      TrendingMovieWidget(trendingMovieList: trendingMovies,)
                  ],
                ),
          )),
    );
  }
}
