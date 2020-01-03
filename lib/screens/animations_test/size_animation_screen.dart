import 'package:flutter/material.dart';
import '../../widgets/animated/animated_builder.dart';

class SizeAnimationScreen extends StatefulWidget {
  @override
  _SizeAnimationScreenState createState() => _SizeAnimationScreenState();
}

class _SizeAnimationScreenState extends State<SizeAnimationScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed){
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed){
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      widget: FlutterLogo(),
      animation: _animation,
    );
  }
}
