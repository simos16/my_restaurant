import 'package:flutter/material.dart';
import 'package:my_restaurant/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Restaurant',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}

