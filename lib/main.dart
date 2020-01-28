import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/animations_test/curved_animation_screen.dart';
import 'package:flutter_animations/screens/home/home_screen.dart';
import 'package:flutter_animations/screens/login/login_screen.dart';
import 'screens/animations_test/size_animation_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
//      home: HomeScreen(),
      home: LoginScreen(),
//      home: CurvedAnimationScreen(),
//      home: SizeAnimationScreen(),
    );
  }
}
