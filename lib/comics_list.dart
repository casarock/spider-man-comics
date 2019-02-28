import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'comic_cell.dart';
import 'comic_detail.dart';
import 'mock_data.dart';

class ComicsList extends StatefulWidget {
  @override
  ComicsListState createState() {
    return new ComicsListState();
  }
}

class ComicsListState extends State<ComicsList> {

  var comicList;

  void getComicData() async {

    //var data = await getJson();
    var data = json.decode(new Mocki().mockData.toString());

    setState(() {
      comicList = data['data']['results'];
    });
  }

  @override
  Widget build(BuildContext context) {

    getComicData();

    return new Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: new AppBar(
          
          centerTitle: true,
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: new Text(
            'Spider-Man Comics',
            style: new TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'homoarak',
                fontWeight: FontWeight.bold),
          ),
        ),
        body: new Padding (
          padding: const EdgeInsets.all(0.0),
          
          child: new Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //new HeroesTitle(),
              new Expanded (

                child: new ListView.builder (
                  itemCount: comicList == null ? 0 : comicList.length,
                  itemBuilder: (context, i) {
                    return  new FlatButton(

                      child: new ComicListCell(comicList, i),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context){
                            return new ComicDetails(comicList[i]);
                          }));
                      },
                      color: Theme.of(context).primaryColor,
                    );

                  }

                ),
              )
            ],
          )
        )
    );
  }
}

Future<Map> getJson() async {
  var apiKey = '49837e5ff6d0be3ab67acb1fbab2ea83';
  var privAPIKey = '67d48db7ddeeba055906bb0afc85e0731a07254f';
  var baseUrl = 'https://gateway.marvel.com:443/v1/public/series/20432/comics?orderBy=-issueNumber';

  var timeStamp = new DateTime.now().millisecondsSinceEpoch.toString();
  var content = new Utf8Encoder().convert('$timeStamp$privAPIKey$apiKey');
  var myHash = crypto.md5.convert(content).toString();

  var url = '$baseUrl&apikey=$apiKey&hash=$myHash&ts=$timeStamp';

  http.Response response = await http.get(url);
  return json.decode(response.body);
}
