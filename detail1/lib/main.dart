import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Aplikasi Bengkel",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarBengkel= new List();

  var karakter = [
    {"nama": "Bengkel Ahoy", "gambar": "aquaman (2).jpg"},
    {"nama": "BengkelBat", "gambar": "bengkel8.jpg"},
    {"nama": "Bengkel Captain", "gambar": "bengkel1.jpg"},
    {"nama": "Bengkel Cat", "gambar": "bengkel2.jpg"},
    {"nama": "Bengkel Flash", "gambar": "bengkel4.jpg"},
    {"nama": "Bengkel Hulk", "gambar": "bengkel10.jpg"},
    {"nama": "Bengkel Ironman", "gambar": "bengkel9.jpg"},
    {"nama": "Bengkel Man", "gambar": "bengkel8.jpg"},
    {"nama": "Bengkel Venom", "gambar": "bengkel9.jpg"},
    {"nama": "Bengkel Super", "gambar": "bengkel6.jpeg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final bengkel = karakter[i];
      final String gambar = bengkel["gambar"];

      daftarBengkel.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              child: new Column(
            children: <Widget>[
              new Hero(
                tag: bengkel['nama'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                                    nama: bengkel['nama'],
                                    gambar: gambar,
                                  ),
                            )),
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(15.0),
              ),
              new Text(
                bengkel['nama'],
                style: new TextStyle(fontSize: 20.0),
              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
          ),  
        backgroundColor: Colors.black,
        centerTitle: true,
        title: new Text(
          "Detail Bengkel",
        style: new TextStyle(color: Colors.white),
    ),
        ),

         
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarBengkel,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 240.0,
              child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new BagianNama(
            nama: nama,
          ),
          new BagianIcon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(15.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 19.0, color: Colors.black),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 10.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
            ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
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
            color: Colors.black,
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

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Hubungi Kami Apabila Perlu bantuan Kami Siap membantu Kapan saja dan dimana saja.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
