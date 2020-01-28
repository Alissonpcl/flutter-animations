import 'package:flutter/material.dart';
import '../../widgets/animated/grow_transition.dart';

class SizeAnimationScreen extends StatefulWidget {
  @override
  _SizeAnimationScreenState createState() => _SizeAnimationScreenState();
}

class _SizeAnimationScreenState extends State<SizeAnimationScreen>
    with SingleTickerProviderStateMixin {
  //Veja o comentario em HomeScreen
  AnimationController _controller;

  //Veja o comentario em StaggerAnimation da Home
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
      //Com o status e possivel detectar a evolucao da animacao e programar
      //como neste exemplo uma animacao que fica indo e voltando
      //Os .. e como se disesse animation.addStatusListener em uma nova linha
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
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

  //OU
//  return AnimatedLogo(animation: _animation);
  }
}
