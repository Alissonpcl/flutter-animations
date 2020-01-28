import 'package:flutter/material.dart';

//Este exemplo mostra que extendendo o AnimatedWidget e possivel criar um widget
// animado que nao precisa ser colocado como filho de um AnimatedWidget
class AnimatedLogo extends AnimatedWidget {

  AnimatedLogo({@required Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
