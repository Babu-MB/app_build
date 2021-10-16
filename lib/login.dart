import 'package:flutter/material.dart';
import './first.dart';
import './create_account.dart';
import './tabs.dart';

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}*/

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    var _select;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //title: Text("Login Page"),

        title: Text('LOGIN'),

        centerTitle: true,
        backgroundColor: Colors.blue[600].withOpacity(0.7),
        leading: Icon(Icons.home),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: [
          Icon(Icons.ac_unit),
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
            /*Positioned(
              top: 0,
              left: 0,
              width: 200,
              height: 100,
              child: Image.asset('assets/images/boychild.jpg'), //   <-- image
              // width: size.width = 0.25,
            ),*/

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10, bottom: 10),
              child: Container(
                width: 200,
                height: 100,
                child: Image.asset('assets/images/kipchoge.jpg'), //   <-- image
                // width: size.width = 0.25,
              ),
              /* child: Center(


                child: Container(
                    width: 200,
                    height: 150,

              Positioned(
              top: 0,
              left: 0,
              width: 200,
              height: 100,
              child: Image.asset('assets/images/boychild.jpg'), //   <-- image
              // width: size.width = 0.25,
            ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Image.asset('asset/images/background.jpg')),
              ),*/
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    //labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter valid email id as abc@gmail.com'),
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
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
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
              height: 100,
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
                  Center(
                    child: Image.asset('assets/images/google.jpg'),
                  ),
                  Center(
                    child: Text('Login with Google'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
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
