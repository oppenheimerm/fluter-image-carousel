import 'package:flutter/material.dart';

import 'UI/photoIndexIndicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //  set image to first
  int photoIndex = 0;

  //  photo array
  List<String> _photos = [
    'images/burger1.jpg',
    'images/burger2.jpg',
    'images/burger3.jpg',
    'images/burger4.jpg'
  ];

  //  error check as array's are zero bound
  void _previousImage(){
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage(){
    setState(() {
      photoIndex = photoIndex < _photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                      image: AssetImage(
                        _photos[photoIndex],
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                  //  set image height/width
                  height: 400.0,
                  width: 300.0,
                ),
                Positioned(
                  top: 375.0,
                  left: 25.0,
                  right: 25.0,
                  child: PhotoIndexIndicator(numberOfDots: _photos.length, photoIndex: photoIndex,),
                ),
              ],
            ),
          ),
          //  Add row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //  Next button
                RaisedButton(
                  child: Text('Next'),
                  onPressed: _nextImage,
                  elevation: 5.0,
                  color: Colors.green,
                ),
              //  Add some padding
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                child: Text('Previous'),
                onPressed: _previousImage,
                elevation: 5.0,
                color: Colors.blue,
              )
            ],
          )
        ],
      ),
    );
  }
}
