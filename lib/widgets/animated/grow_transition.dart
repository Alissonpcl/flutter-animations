import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {

  final Widget widget;

  //Veja o comentario em StaggerAnimation da Home
  final Animation<double> animation;

  GrowTransition({this.widget, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      //Veja StaggerAnimation da Home
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child){
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        //Nao necessario, mas e uma boa pratica conforme documentacao
        //informar o child se ja existir para ser repassado para o builder e
        //nao precisar ser reconstruido. Neste exemplo aqui o FlutterLogo
        //e repassado e nao precisa ser recriado.
        //Obs.: Neste caso em especifico nao precisava ser utilizado pois a
        // propria propriedade widget desta classe ja contem o widget para ser
        // reaproveitado
        child: widget,
      ),
    );
  }
}
