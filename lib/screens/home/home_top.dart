import 'package:flutter/material.dart';

import 'category_view.dart';

class HomeTop extends StatelessWidget {
  //O controller e responsavel por controlar a alteracao dos valores
  //durante o process de build. Basicamente o value do controller ira
  //variar entre 0 e 1 e sera utilizada para alterar as propriedades dos
  //widgets
  final Animation<double> containerGrow;

  HomeTop({this.containerGrow});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Bem vindo Alisson!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Container(
              alignment: Alignment.topRight,

              //Aqui um exemplo do value do animation sendo utilizado para
              //atualizar dinamicamente o valor das propriedades e animar o
              //container que irá crescer de 0 (=0*120) ate 120 (=1*120)
              //Obs.: A animacao funciona aqui pois este widget esta sendo
              //carregado dentro de um AnimatedBuilder (veja StaggerAnimation)
              width: containerGrow.value * 120,
              height: containerGrow.value * 120,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("images/perfil.png"),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                width: containerGrow.value * 35,
                height: containerGrow.value * 35,
                margin: EdgeInsets.only(left: 80),
                child: Text(
                  "2",
                  style: TextStyle(
                    fontSize: containerGrow.value * 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(80, 210, 194, 1),
                ),
              ),
            ),
            CategoryView(),
          ],
        ),
      ),
    );
  }
}
