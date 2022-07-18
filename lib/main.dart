import 'package:flutter/material.dart';
//import 'package:myapp/login.dart';
import 'package:myapp/splash.dart';

import './splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
