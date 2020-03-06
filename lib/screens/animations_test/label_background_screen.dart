import 'package:flutter/material.dart';

//Exemplo que mostra como o background de um Container e o Shadow podem ser animador
class LabelBackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: StatusLabel(text: "Recebido"),
      ),
    );
  }
}

class StatusLabel extends StatefulWidget {
  final String text;

  StatusLabel({@required this.text});

  @override
  _StatusLabelState createState() => _StatusLabelState();
}

class _StatusLabelState extends State<StatusLabel>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<Color> _animation;
  Animatable<Color> _animatable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

//      ..addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        _controller.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        _controller.forward();
//      }
//    });

    //Animatable usado para quando tiver mais de 2 cores
//    _animatable = TweenSequence<Color>([
//      TweenSequenceItem(
//        weight: 1.0,
//        tween: ColorTween(
//          begin: Colors.red,
//          end: Colors.yellow,
//        ),
//      ),
//      TweenSequenceItem(
//        weight: 1.0,
//        tween: ColorTween(
//          begin: Colors.yellowAccent,
//          end: Colors.green,
//        ),
//      ),
//    ]);

    _animation = ColorTween(
      begin: Colors.orange,
      end: Colors.orange,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    //Usando o repeat nao e necessario a animacao executara infitamente
    //O reverse e para ir na direcao contrario ao inves de comecar do 0 novamente
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.orange,
//            color: _animation.value,
//            color: _animatable.evaluate(AlwaysStoppedAnimation(_controller.value)),
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.orange,
                blurRadius: 5.0 * _controller.value,
                spreadRadius: 3 * _controller.value,
              )
            ],
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}
