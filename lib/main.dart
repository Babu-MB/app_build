///import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/login.dart';

import './login.dart';
//import './first.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginDemo(),
    );
  }
}
