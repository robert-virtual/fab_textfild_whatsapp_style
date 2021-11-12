import 'package:flutter/material.dart';
import 'package:tests_app/pages/home_page.dart';

// url de imagen :
//https://images.unsplash.com/photo-1636622697498-8f60b9226824

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
} 