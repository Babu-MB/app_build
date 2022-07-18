/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/tabs.dart';
//import 'package:GoogleSignIn/homepage.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, String data}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
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

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    // ignore: unused_local_variable
    User user = result.user;

    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Tabs()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Card(
          margin: EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "GEEKS FOR GEEKS",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: MaterialButton(
                    color: Colors.teal[100],
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/googleimage.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Sign In with Google")
                      ],
                    ),

                    // by onpressed we call the function signup function
                    onPressed: signup(context),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
//import 'package:myapp/login.dart';
//import './first.dart';
import './third.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  SecondPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  final String data;
  //SearchBar searchBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Staggered GridView Demo"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: StaggeredGridView.count(
        primary: false,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 6,
        shrinkWrap: true,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        staggeredTiles: [
          StaggeredTile.count(6, 2),
          StaggeredTile.count(4, 2),
          StaggeredTile.count(2, 2),
          StaggeredTile.count(2, 2),
          StaggeredTile.count(4, 2),
          StaggeredTile.count(3, 2),
          StaggeredTile.count(3, 2),
          StaggeredTile.count(4, 2),
          StaggeredTile.count(2, 2),
          StaggeredTile.count(2, 1),
          StaggeredTile.extent(4, 250)
        ],
        children: <Widget>[
          myPhotoList('assets/gifs/phone.gif'),
          myPhotoList('assets/images/boychild.jpg'),
          myPhotoList('assets/images/laptop.jpg'),
          myPhotoList('assets/images/mars.jpg'),
          myPhotoList('assets/images/software.jpg'),
          myPhotoList('assets/images/kipchoge.jpg'),
          myPhotoList('assets/images/tools.jpg'),
          captionText("WE ARE", "FAMILY"),
          myPhotoList('assets/images/kipchoge.jpg'),
          lineText("GROWTH"),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(
                          //data: '',
                          ),
                    ),
                  );
                }),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget captionText(String titleText, String subText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 5.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  titleText,
                  style: TextStyle(color: Colors.black, fontSize: 24.0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  subText,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lineText(String subText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 5.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  subText,
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myPhotoList(String MyImages) {
    if (MyImages.contains("http")) {
      return Container(
        child: Image.network(MyImages),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: ExactAssetImage(MyImages),
          ),
        ),
      );
    }
  }

  /*Widget myPhotos(String MyImages) {
    return Image(image: Image.asset('assets/images'),

    );
  }*/
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
        //centerTitle: true,
        backgroundColor: Colors.blue[600].withOpacity(0.7),
        //leading: Icon(Icons.home),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // actions: [searchBar.getSearchAction(context)]
      ),
       body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Container(
                  child: Image.asset('assets/images/boychild.jpg'),

                  //   <-- im age
                  //width: size.width = 0.25,
                ),
              ),

              //Image.asset('assets/images/boychild.jpg'),

              // Image.asset(imageList[index]),
              //Text("Some text"),
            ],
          ),
        ),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(1, index.isEven ? 1.2 : 1.8),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );

     /* body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dirt.jpg"), //   <-- image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          //alignment: Alignment.bottomCenter,
          child: Text(
            "Flutter Background Image utaipenda ",
            style: TextStyle(
              color: Colors.blue[500],
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'IndieFlower',
            ),
          ),
        ),
      ),*/

      /*(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Image.asset('assets/images/mars.jpg'), //   <-- image
        ElevatedButton(
            child: Text('Go to third'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ThirdPage(data: "Hello there from the previous page!"),
                ),
              );
            })
      ])),*/
      /*bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(
                        data: '',
                      ),
                    ),
                  );
                }),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),

      // ignore: missing_required_param
       floatingActionButton: FloatingActionButton(
                                  backgroundColor: Colors.red[600],
                                  child: Text('click'),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LoginDemo(),
                                      ),
                                    );
                                  }),*/
    );
  }*/

// ignore: unused_element
  void _select(value) {
    switch (value) {
      case 'Home':
        break;
      case 'Order':
        break;
    }
    print(value);
  }
}
