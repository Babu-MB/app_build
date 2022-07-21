import 'package:flutter/material.dart';
//import 'package:myapp/login.dart';
import 'package:myapp/splash.dart';
// import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import './splash.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var DefaultFirebaseOptions;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}*/
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
