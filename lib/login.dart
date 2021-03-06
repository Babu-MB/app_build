//import 'dart:html';

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:provider/provider.dart';
import './first.dart';
import './create_account.dart';
import './tabs.dart';
import './forgot_password.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//import './splash.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing the firebase app
  await Firebase.initializeApp();

  // calling of runApp
  // runApp(GoogleSignIn());
}*/

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
// function to implement the google signin

// creating firebase instance
  /* final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      // ignore: unused_local_variable
      User user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginDemo()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }*/

  @override
  Widget build(BuildContext context) {
    var _select;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('LOGIN'),
        centerTitle: true,
        backgroundColor: Colors.blue[600].withOpacity(0.7),
        leading: Icon(Icons.home),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: [
          // Icon(Icons.ac_unit),
          PopupMenuButton(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return {'Home', 'Create'}.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10, bottom: 10),
              child: Container(
                width: 200,
                height: 100,
                child: Image.asset('assets/images/kipchoge.jpg'), //   <-- gif
                // width: size.width = 0.25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email or phone number',
                    hintText: 'Email or phone number'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),

              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),

                /*focusedBorder: UnderlineInputBorder(
                  borderSide:(color.Colors.green)),*/
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateAccount(),
                  ),
                );
              },
              child: Text(
                'New User? Create Account',
                style: TextStyle(color: Colors.blueGrey, fontSize: 12),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white60,
                        fontFamily: 'IndieFlower',
                        fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Tabs(),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ForgotPassword(),
                  ),
                );
              },
              child: Text(
                'Forgoten password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.transparent,
                style: BorderStyle.solid,
                width: 1.0,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /* ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity, 50)),
                      child: Text('Sign in with Google'),
                      onPressed: () {
                        //signup(context);
                      }),*/
                  Image(
                    image: AssetImage("assets/images/google.jpg"),
                    height: 35.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                child: Text('Go to First'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
