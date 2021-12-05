//import 'dart:ffi';
import 'dart:async';
import 'package:flutter/material.dart';
import './login.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState

    return SplashState();
  }
}

class SplashState extends State<Splash> {
  // const Splash({Key key}) : super(key: key);

/*  void initState() {
    initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginDemo(),
          ));
    });
  }*/

  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    Future.delayed(Duration(seconds: 2), () {
      BuildContext context;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginDemo(),
          ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 100,
              child: Image.asset('assets/images/mars.jpg'),
            ),
            Container(
              child: Text(
                'Splash Screen',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
