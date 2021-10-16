import 'package:flutter/material.dart';
import './second.dart';
import './login.dart';

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    //var size;
    return Scaffold(
      appBar: AppBar(
        title: Text('First '),
        centerTitle: true,
        backgroundColor: Colors.red[600].withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/boychild.jpg'), //   <-- image
                // width: size.width = 0.25,
              ),
              Text(
                "scrolable page ",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IndieFlower',
                ),
              ),
              Image.asset('assets/images/mars.jpg'), //   <-- image
              Text(
                "Continuation",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IndieFlower',
                ),
              ),

              Image.asset('assets/images/background.jpg'), //   <-- image
              ElevatedButton(
                  child: Text('Go to second'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                            data: "Hello there from the first page!"),
                      ),
                    );
                  }),

              FloatingActionButton(
                  backgroundColor: Colors.red[600].withOpacity(0.7),
                  child: Text('HOME'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginDemo(),
                      ),
                    );
                  }),

              // Row(),
            ],
          )
          /*child:column(children <Widget>[
            inputfilelabel:"username"
          ],),*/

          ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
