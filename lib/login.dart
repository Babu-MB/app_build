import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
//import 'package:myapp/third.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:provider/provider.dart';
import './first.dart';
import './create_account.dart';
import './tabs.dart';
import './forgot_password.dart';
//import './first_screen.dart';
//import './firebase.py';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing the firebase app
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(MyApp());

  // calling of runApp
  // runApp(GoogleSignIn());
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

// creating firebase instance
final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signup(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credentialf
    UserCredential result =
        (await auth.signInWithCredential(authCredential)) as UserCredential;
    // ignore: unused_local_variable
    //User user = result.user;

    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Tabs()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}

Future<void> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      (await _auth.signInWithCredential(credential)) as UserCredential;
  final User user = authResult.user;

  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}
/*
// ignore: missing_return
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  // ignore: unused_local_variable
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  //return await FirebaseAuth.instance.signInWithCredential(credential);
}*/
// function to implement the google signin

class _LoginDemoState extends State<LoginDemo> {
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
            /*FloatingActionButton.extended(
                label: Text('sign in'), onPressed: (() => ThirdPage())),*/
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
                  FloatingActionButton.extended(
                      label: Text('sign in'),

                      /* onPressed: () {
                      signInWithGoogle().then((result) {
                        if (result != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FirstScreen(), //FirstScreen
                            ),
                          );
                        }
                      });
                    },*/
                      onPressed: (() => signInWithGoogle)),
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
                      builder: (context) => FirstPage(), //firebase
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class UserCredential {
  User get user => null;
}
