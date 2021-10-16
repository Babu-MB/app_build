import 'package:flutter/material.dart';

//import './login.dart';

//import './second.dart';
class ThirdPage extends StatelessWidget {
  ThirdPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  final String data;

  Widget build(BuildContext context) {
    // final title = 'Floating App Bar';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: title,
      home: Scaffold(
        // No appbar provided to the Scaffold, only a body with a

        // CustomScrollView.

        body: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            // Add the app bar to the CustomScrollView.

            SliverAppBar(
              // Provide a s
              //ndard title.

              title: Text('Third'),
              centerTitle: true,

              // Allows the user to reveal the app bar if they begin scrolling

              // back up the list of items.

              floating: true,
              pinned: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/dirt.jpg"), //   <-- image
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),

              /* flexibleSpace: FlexibleSpaceBar(
                //title: Text('FilledStacks'),
                background: Image.asset(
                  'kipchoge.jpg', // <===   Add your own image to assets or use a .network image instead.
                  fit: BoxFit.cover,
                ),
              ),*/

              // Make the initial height of the SliverAppBar larger than normal.

              expandedHeight: 100,
            ),

            SliverFillRemaining(
              child: Column(
                children: List<int>.generate(2, (index) => index)
                    .map((index) => Container(
                          height: 200,
                          margin: EdgeInsets.symmetric(vertical: 1),
                          color: Colors.grey[300],
                          alignment: Alignment.center,

                          child: Image.asset(
                              'assets/images/mars.jpg'), //   <-- image
                          //child: Text('$index item'),
                        ))
                    .toList(),
              ),
            ),

            SliverList(
              // Use a delegate to build items as they're scrolled on screen.

              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that

                // displays the index of the current item.

                (context, index) => ListTile(title: Text('Item #$index')),

                // Builds 1000 ListTiles

                childCount: 10,
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              Spacer(),
              //IconButton(icon: Icon(Icons.next_plan), onPressed: () {}),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  /* return Scaffold(


      appBar: AppBar(
        title: Text('Third'),
        centerTitle: true,
        backgroundColor: Colors.green[600],
      ),
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
            "Flutter Background Image",
            style: TextStyle(
              color: Colors.blueGrey[500],
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'IndieFlower',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[600],
          child: Text('HOME'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginDemo(),
              ),
            );
          }),
    );
  }*/
}

/*DatesService() {
}
      
      class _bgColors {
}*/

/*child: NestedScrollView(NestedScrollViewHeaderSliversBuilder(context, innBoxIsScrolled)
{return <widget> [
  SliverAppBar(
    backgroundColor: _bgColors[DatesService().checkTimeOfDay]
  )],
actions: <Widget>[ 
  IconButton(
    onPressed:navSearch,
    icon:Icon(Icons.Search),
  ),
],
},),
*/

