import 'package:flutter/material.dart';

class HeroesTitle extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
      child: new Text(
        'Latest Releases',
        style: new TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
