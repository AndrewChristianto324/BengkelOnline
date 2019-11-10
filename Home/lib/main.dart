import 'package:Bengkel/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage()
  )
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
    
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.motorcycle),
          title: Text(''),
        ),
      ],
    ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300, 
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeAnimation(1, Text("MY BENGKEL", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 30,),
                    FadeAnimation(1.3, Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey,),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                          hintText: "Search for Bengkel..."
                        ),
                      ),
                    )),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
  
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Bengkel Terdekat", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.4, Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(image: 'assets/images/canada.jpg', title: 'BSD'),
                        makeItem(image: 'assets/images/Italy.jpg', title: 'Gading Serpong'),
                        makeItem(image: 'assets/images/greece.jpg', title: 'Cikokol'),
                        makeItem(image: 'assets/images/united-states.jpg', title: 'Karawaci')
                      ],
                    ),
                  )),

                  SizedBox(height: 20,),
                  FadeAnimation(1, Text("Daerah", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),)),
                  SizedBox(height: 20,),                
                  FadeAnimation(1.4, Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(image: 'assets/images/united-states.jpg', title: ''),
                        makeItem(image: 'assets/images/greece.jpg', title: ''),
                        makeItem(image: 'assets/images/Italy.jpg', title: ''),
                        makeItem(image: 'assets/images/canada.jpg', title: '')
                      ],
                    ),
                  )),
                  SizedBox(height: 80,),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
