import 'package:flutter/material.dart';

class ComicListCell extends StatelessWidget {

  final comics;
  final i;

  ComicListCell (this.comics, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(

                margin: const EdgeInsets.all(16.0),
                child: new Container(
                  width: 80.0,
                  height: 80.0,
                ),

                decoration: new BoxDecoration(
                  //borderRadius: new BorderRadius.circular(4.0),
                  color: Theme.of(context).backgroundColor,
                  image: new DecorationImage(
                      image: new NetworkImage(
                        comics[i]['images'][0]['path'] + "." + comics[i]['images'][0]['extension']
                      ),
                      fit: BoxFit.cover
                    ),

                  boxShadow: [
                    new BoxShadow(
                      color: Theme.of(context).primaryColorDark,
                      blurRadius: 5.0,
                      offset: new Offset(1.0, 1.0)
                    )
                  ],
                ),
              ),
            ),

            new Expanded(
              child: new Container(
                margin: const EdgeInsets.fromLTRB(16.0,0.0,16.0,0.0),
                child: new Column(
                  children: [

                    new Text(
                      comics[i]['title'],
                      style: Theme.of(context).textTheme.title,
                    ),

                    new Padding(padding: const EdgeInsets.all(2.0)),

                    new Text(comics[i]['description'],
                      maxLines: 3,
                      style: new TextStyle(
                        color: Theme.of(context).accentColor,
                        fontFamily: 'roboto'
                      ),
                    )
                  ],
                crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
            ),
          ],
        ),

        new Container(
          width: 400.0,
          height: 0.5,
          color: Theme.of(context).accentColor,
          margin: const EdgeInsets.all(0.0),
        )

      ],
    );
  }
}