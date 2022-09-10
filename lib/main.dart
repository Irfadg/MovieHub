import 'package:flutter/material.dart';
import 'package:movie_hub/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieHub',
      theme: ThemeData(
        
       // primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
