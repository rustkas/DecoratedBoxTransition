import 'package:decoratebox_transition/images.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String title = 'DecorateBoxTransition';

  DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.grey, style: BorderStyle.solid, width: 8.0),
        borderRadius: BorderRadius.zero,
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black, blurRadius: 14.0, spreadRadius: 8.0)
        ]),
    end: BoxDecoration(
      color: Colors.grey,
      border: Border.all(
          color: Colors.orange, style: BorderStyle.solid, width: 4.0),
      borderRadius: BorderRadius.circular(8.0),
      shape: BoxShape.rectangle,
    ),
  );

  AnimationController _controller;

  bool _transit = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DecoratedBoxTransition(
              position: DecorationPosition.background,
              decoration: _decorationTween.animate(_controller),
              child: Container(
                  padding: EdgeInsets.all(64.0),
                  width: 300.0,
                  height: 300.0,
                  child: Image(
                    image: AssetImage(blackWidow),
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  if (_transit) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                  _transit = !_transit;
                },
                elevation: 0.0,
                child: Icon(Icons.play_arrow, color: Colors.white, size: 36.0),
                tooltip: 'Play',
                heroTag: 'Transit',
                backgroundColor: Color(0xFF832685),
              ),
            )
          ],
        ),
      ),
    );
  }
}
