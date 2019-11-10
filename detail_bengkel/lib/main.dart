import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DetailBengkel',
      home: Detail
      (title: 'Bengkel Mana'),
    );
  }
}

class Detail extends StatefulWidget {
  Detail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Material(
              child: new InkWell(
                child: new Image.asset(
                  'img/1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          new NamaBengkel(
          ),
          new BagianIcon(
          ),
          new Keterangan(
          ),
        ],
      ),
      );
  }
}

class NamaBengkel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Bengkel Mana',
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget{
  BagianIcon();

  @override 
  Widget build(BuildContext context){
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          Iconteks(
                      icon: Icons.call,
                      teks: '+62 xxx xxxx xx',
                    ),
                  ],
                ),
              );
            }
          }
class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.red,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, color: Colors.black),
          )
        ],
      ),
    );
  }
}  

class Keterangan extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
    child: new Text(
     'Alamat',
     textAlign: TextAlign.left,
     style: TextStyle(color: Colors.black, fontSize: 15),
     ),
   );
  }
}
