import 'package:flutter/material.dart';
import 'package:staggered_animation_example/pages/animation_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationHomePage(),
    );
  }
}
