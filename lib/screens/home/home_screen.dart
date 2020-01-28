import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/home/stagger_animation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  //O controller funciona como uma timeline da animacao
  //com as funcoes de forward, backward, cancel e tempo
  //total da animacao
  //Definido na Screen pois e o widget que controla o estado
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggerAnimation(
      controller: _controller.view,
    );
  }
}
