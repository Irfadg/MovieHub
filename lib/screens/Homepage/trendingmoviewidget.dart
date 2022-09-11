import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_hub/functions/common_functions.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TrendingMovieWidget extends StatefulWidget {
  const TrendingMovieWidget({Key? key}) : super(key: key);
  

  @override
  State<TrendingMovieWidget> createState() => _TrendingMovieWidgetState();
}

class _TrendingMovieWidgetState extends State<TrendingMovieWidget> {
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
    return Text("");
  }
}