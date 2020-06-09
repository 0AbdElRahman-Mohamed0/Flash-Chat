import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  final double height;
  MyHero({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Hero(
        tag: 'logo',
        child: Container(
          child: Image.asset('images/logo.png'),
          height: height,
        ),
      ),
    );
  }
}
