import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {

  final Widget widget;
  final Animation<double> animation;

  GrowTransition({this.widget, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child){
          return Container(
            width: animation.value,
            height: animation.value,
            child: widget,
          );
        },
        child: widget,
      ),
    );
  }
}
