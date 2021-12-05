import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/first.dart';

//import 'package:share/share.dart';
void main() => runApp(const Tabs());

class Tabs extends StatelessWidget {
  const Tabs({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text('Technician');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: customSearchBar,
            actions: <Widget>[
              IconButton(
                icon: customIcon,
                onPressed: () {
                  setState(() {
                    if (this.customIcon.icon == Icons.search) {
                      // Perform set of instructions.

                      this.customIcon = Icon(Icons.cancel);
                      customSearchBar = ListTile(
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: 'search here',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      this.customIcon = Icon(Icons.search);
                      this.customSearchBar = Text('Technician');
                    }
                  });
                },
              ),
              CircleAvatar(
                  radius: (20),
                  backgroundColor: Colors.white60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/boychild.jpg'),
                  )),
            ],

            /* Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        title: Text('Technician'),
        centerTitle: true,

        // Allows the user to reveal the app bar if they begin scrolling

        // back up the list of items.

        floating: true,
        pinned: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // Display a placeholder widget to visualize the shrinking size.
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/dirt.jpg"), //   <-- image
              fit: BoxFit.cover,
            ),
          ),
        ),
        expandedHeight: 200.0,*/
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
                Tab(
                  icon: Icon(Icons.beach_access_sharp),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/tools.jpg"), //   <-- image
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.inbox,
                    color: Colors.black,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  title: Text("Inbox"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.star_border,
                    color: Colors.black,
                  ),
                  title: Text("Starred"),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => FirstPage()));
                  },
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.snooze,
                    color: Colors.black,
                  ),
                  title: Text("Snoozed"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.label_important,
                    color: Colors.black,
                  ),
                  title: Text("Important"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.inbox,
                    color: Colors.black,
                  ),
                  title: Text("draft"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.inbox,
                    color: Colors.black,
                  ),
                  title: Text("sent"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                )
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    child:
                        Image.asset('assets/images/tools.jpg'), //   <-- image
                    // width: size.width = 0.25,
                  ),
                  Text(
                    "The Technician ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  Image.asset('assets/images/laptop.jpg'), //   <-- image
                  Text(
                    "Creating Connection",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  ),

                  Image.asset('assets/images/background.jpg'), //   <-- image
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: StaggeredGridView.count(
                  //physics: AlwaysScrollableScrollPhysics(),

                  scrollDirection: Axis.vertical,
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  staggeredTiles: [
                    StaggeredTile.count(4, 2),
                    StaggeredTile.count(2, 2),
                    StaggeredTile.count(2, 2),
                    StaggeredTile.count(1, 2),
                    StaggeredTile.count(2, 2),
                    StaggeredTile.count(1, 2),
                    StaggeredTile.count(2, 3),
                    // StaggeredTile.count(4, 1),
                    //StaggeredTile.extent(4, 250)
                  ],
                  children: <Widget>[
                    myPhotoList('assets/images/boychild.jpg'),
                    myPhotoList('assets/images/laptop.jpg'),
                    myPhotoList('assets/images/mars.jpg'),
                    myPhotoList('assets/images/software.jpg'),
                    myPhotoList('assets/images/kipchoge.jpg'),
                    myPhotoList('assets/images/tools.jpg'),
                    // myPhotoList('assets/images/background.jpg'),
                    captionText("WE ARE", "FAMILY"),
                  ],
                ),
              ),
            ),
            Column(children: [
              Expanded(
                child: GridView(
                  padding: const EdgeInsets.all(5),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 3,
                  ),
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                          'assets/images/boychild.jpg'), //   <-- image
                      // width: size.width = 0.25,
                    ),
                    Text(
                      "scrolable page ",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IndieFlower',
                      ),
                    ),
                    Image.asset('assets/images/mars.jpg'), //   <-- image
                    Text(
                      "Continuation",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IndieFlower',
                      ),
                    ),

                    Image.asset('assets/images/background.jpg'), //   <-- image
                    Container(
                      height: 250,
                      width: 100,
                      child: Image.asset(
                          'assets/images/kipchoge.jpg'), //Text("hello"),
                    ),

                    Container(
                      height: 250,
                      width: 100,
                      child: Image.asset(
                          'assets/images/mars.jpg'), //Text("hello"),
                    ),

                    Container(
                      height: 250,
                      width: 100,
                      child: Image.asset(
                          'assets/images/boychild.jpg'), //Text("hello"),
                    ),
                  ],
                ),
              ),
            ]),

            //Center(child: Image.asset('assets/images/kipchoge.jpg')),
            // Center(child: Image.asset('assets/images/mars.jpg'))
          ]),
        ));
  }

  Widget captionText(String titleText, String subText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 8.0),
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
}
