//import 'dart:ffi';
import 'dart:async';
import 'package:flutter/material.dart';
import './login.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  // const Splash({Key key}) : super(key: key);

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
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
              height: 250,
              width: 200,
              child: Image.asset('assets/images/mars.jpg'),
            ),
            SizedBox(height: 200.0),
            Container(
              child: Text(
                'Powered by Electroworld',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
