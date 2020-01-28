import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  int _category = 0;
  final List<String> _categories = [
    "Trabalho",
    "Estudos",
    "Casa",
  ];

  void _selectForward(){
    setState(() {
      _category++;
    });
  }

  void _selectBackward(){
    setState(() {
      _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          disabledColor: Colors.transparent,
          onPressed: _category > 0 ? _selectBackward : null,
        ),
        Text(
          _categories[_category].toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.white,
          disabledColor: Colors.transparent,
          onPressed: _category < _categories.length - 1 ? _selectForward : null,
        ),
      ],
    );
  }
}
