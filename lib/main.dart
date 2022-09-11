import 'package:flutter/material.dart';
import 'package:movie_hub/screens/Homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      title: 'MovieHub',
      theme: ThemeData(
        // brightness: Brightness.dark
       // primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

