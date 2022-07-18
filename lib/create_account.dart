import 'package:flutter/material.dart';
import './login.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final name = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    name.dispose();
    super.dispose();
  }

  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginDemo(),
      ),
    );

    // Do something
  }

  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account '),
        centerTitle: true,
        backgroundColor: Colors.red[600].withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(children: <Widget>[
          /*Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Center(
              child: Text(
                "Create an account it's free",
                style: TextStyle(fontSize: 2.0),
              ),
            ),
          ),*/
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 25, bottom: 0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: ''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: '+254'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                  hintText: 'Enter valid email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 15),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Minimum of 8 charactrs'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 25),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  hintText: ''),
            ),
          ),
          Material(
            child: Checkbox(
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value ?? false;
                });
              },
            ),
          ),
          const Text(
            'I have read and accept terms and conditions',
            overflow: TextOverflow.ellipsis,
          ),
          /* GestureDetector(
              onTap: () {
                if (name.text == null || name.text.length == 0) {
                  return;
                }
                Navigator.pop(context, name.text);
              },
              child: Container(
                width: 350.0,
                height: 50.0,
                child: Center(
                    child: Text(
                  " Sign up ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(7.0)),
              )),*/
          ElevatedButton(
              onPressed: agree ? _doSomething : null,
              child: const Text('Sign up'))
        ]),
      ),
    );
  }
}
