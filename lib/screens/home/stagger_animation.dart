import 'package:flutter/material.dart';

import 'animated_list_view.dart';
import 'fade_container.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  //O animation define a animacao que ira acontecer dentro
  //da timeline de um controller
  final Animation<double> containerGrow;
  final Animation<EdgeInsets> _listSlidePosition;
  final Animation<Color> fadeAnimation;

  StaggerAnimation({@required this.controller})
      : containerGrow = CurvedAnimation(
          parent: controller,
          curve: Curves.ease,
        ),
        _listSlidePosition = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 0),
          //80 e equivalente a altura de cada item da lista (definido
          //no container da imagem em ListData) mais 10 para cima e
          //10 para baixo de espacamento
          end: EdgeInsets.only(bottom: 80),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.325,
              0.8,
              curve: Curves.ease,
            ),
          ),
        ),
        fadeAnimation = ColorTween(
          begin: Color.fromRGBO(247, 64, 106, 1.0),
          end: Color.fromRGBO(247, 64, 106, 0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
          ),
        );

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            HomeTop(
              containerGrow: containerGrow,
            ),
            AnimatedListView(
              listSlidePosition: _listSlidePosition,
            ),
          ],
        ),
        //Utilizado IgnorePointer para que mesmo que o widget filho fique por
        // cima de outros conteudos o clique seja passado direto para widgets
        // que ficaram em baixo
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //O AnimatedBuilder e um widget que basicamente "avisa" ao Flutter
        //que deve rebuildar os widgets filhos quando o animation alterar seu valor
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}
