import 'package:flutter/material.dart';

import 'list_data.dart';

class AnimatedListView extends StatelessWidget {

  final Animation<EdgeInsets> listSlidePosition;
  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: "Estudar Flutter 1",
          subtitle: "Curso Daniel Cioffi",
          image: AssetImage("images/perfil.png"),
          //Aqui o margin esta dizendo que este widget ficara posicionado
          //dentro da Stack verticalmente value*3 pixels acima do final da Stack
          //Como o alignhamento da Stack e bottomCenter, os itens sao alinhados
          //de baixo para cima sendo que o widget com maior valor de margin bottom
          //ficara mais acima
          margin: listSlidePosition.value * 3,
        ),
        ListData(
          title: "Estudar Flutter 2",
          subtitle: "Curso Daniel Cioffi",
          image: AssetImage("images/perfil.png"),
          margin: listSlidePosition.value * 2,
        ),
        ListData(
          title: "Estudar Flutter 3",
          subtitle: "Curso Daniel Cioffi",
          image: AssetImage("images/perfil.png"),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: "Estudar Flutter 4",
          subtitle: "Curso Daniel Cioffi",
          image: AssetImage("images/perfil.png"),
          //Esse item tem margin 0, logo ficara exatamente no final da stack
          margin: listSlidePosition.value * 0,
        ),
      ],
    );
  }
}
