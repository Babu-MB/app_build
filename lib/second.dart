import 'package:flutter/material.dart';
//import 'package:myapp/login.dart';
//import './first.dart';
import './third.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  SecondPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  final String data;
  //SearchBar searchBar;

  List<String> imageList = [
    'background.jpg'
        'boychild.jpg'
        'dirt.jpg'
        'laptop.jpg'
        'mars.jpg'
        'softwarejpg'
        'images.jpg'
        'kipchoge.jpg'
        'google.jpg'
        'image2.jpg'
        'tools.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
        centerTitle: true,
        backgroundColor: Colors.blue[600].withOpacity(0.7),
        //leading: Icon(Icons.home),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // actions: [searchBar.getSearchAction(context)]
      ),

      /*    body: Container(
          margin: EdgeInsets.all(12),
          child:  StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                          Radius.circular(15))
                  ),

*/

      body: Container(
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
      ),

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

      // ignore: missing_required_param
      /* floatingActionButton: FloatingActionButton(
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
  }
}

//mixin SearchBar {
//getSearchAction(BuildContext context) {}}

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
