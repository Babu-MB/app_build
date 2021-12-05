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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          title: Text("Flutter Staggered GridView Demo"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: StaggeredGridView.count(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 6.0,
              staggeredTiles: [
                StaggeredTile.count(4, 2),
                StaggeredTile.count(2, 2),
                StaggeredTile.count(2, 2),
                StaggeredTile.count(1, 2),
                StaggeredTile.count(2, 2),
                StaggeredTile.count(1, 2),
                StaggeredTile.count(2, 3),
                StaggeredTile.count(4, 1),
                //StaggeredTile.extent(4, 250)
              ],
              children: <Widget>[
                myPhotoList('assets/images/boychild.jpg'),
                myPhotoList('assets/images/laptop.jpg'),
                myPhotoList('assets/images/mars.jpg'),
                myPhotoList('assets/images/software.jpg'),
                myPhotoList('assets/images/kipchoge.jpg'),
                myPhotoList('assets/images/tools.jpg'),
                myPhotoList('assets/images/background.jpg'),
                captionText("WE ARE", "FAMILY"),
              ],
            ),
          ),
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
                          data: '',
                        ),
                      ),
                    );
                  }),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
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
            SizedBox(height: 10.0),
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
