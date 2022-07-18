import 'package:flutter/material.dart';
import './create_account.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final name = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    name.dispose();
    super.dispose();
  }

  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgoten your Password'),
        centerTitle: true,
        backgroundColor: Colors.grey[600].withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(children: <Widget>[
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
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.9),
              //borderRadius: BorderRadius.circular(20)
            ),
            child: TextButton(
              child: Text(
                'NEXT',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'IndieFlower',
                    fontSize: 20),
              ),
              onPressed: () {
                /*Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Tabs(),
                      ),
                    );*/
              },
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
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          TextButton(
            onPressed: () {
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateAccount(),
                ),
              );*/
            },
            child: Text(
              'Having trouble? Find help',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        ]),
      ),
    );
  }
}
