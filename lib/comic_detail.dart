import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ComicDetails extends StatelessWidget {
  
  final comic;
  
  ComicDetails(this.comic);
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(fit: StackFit.expand, children: [
        new Image.network(
          comic['images'][0]['path'] + "." + comic['images'][0]['extension'],
          fit: BoxFit.cover,
        ),
        
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.7),
          ),
        ),

        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 400.0,
                    height: 550.0,
                  ),

                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(5.0),
                    image: new DecorationImage(
                      image: new NetworkImage(
                        comic['images'][0]['path'] + "." + comic['images'][0]['extension']
                      ),
                      fit: BoxFit.cover
                    ),

                    boxShadow: [
                      new BoxShadow(
                        color: Theme.of(context).secondaryHeaderColor,
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 5.0)
                      )
                    ]
                  ),
                ),

                new Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 0.0
                  ),
                  child: new Row(
                    children: <Widget>[

                      new Expanded(
                        child: new Text(
                        
                          comic['title'],

                          style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 30.0,
                          ),
                        )
                      ),

                    ],
                  ),
                ),

                new Text(
                  comic['description'],
                  style: new TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Arvo')
                ),

                new Padding(padding: const EdgeInsets.all(10.0)),

                new Row(
                  children: <Widget>[

                    new Expanded(
                      child: new FlatButton(
                        child: new Container(
                          width: 400.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          child: new Text(
                            'Close',
                            style: new TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Arvo',
                              fontSize: 20.0),
                          ),
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Theme.of(context).buttonColor
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ),

                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}