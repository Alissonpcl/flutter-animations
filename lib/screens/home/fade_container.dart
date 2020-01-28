import 'package:flutter/material.dart';

class FadeContainer extends StatelessWidget {
  final Animation<Color> fadeAnimation;

  FadeContainer({@required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    //Recebe o widget criado pelo Hero da StaggerAnimation da LoginScreen
    //para animar a opacidade
    return Hero(
      tag: "fade",
      child: Container(
        decoration: BoxDecoration(
          color: fadeAnimation.value,
        ),
      ),
    );
  }
}
