import 'package:flutter/material.dart';
import 'package:myapp/first.dart';

//import 'package:share/share.dart';
void main() => runApp(const Tabs());

/// This is the main application widget.

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
                    height: 150,
                    child: Image.asset(
                        'assets/images/boychild.jpg'), //Text("hello"),
                  ),
                  Text(
                    " Open ",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  Container(
                    height: 150,
                    child:
                        Image.asset('assets/images/dirt.jpg'), //Text("hello"),
                  ),
                  Text(
                    " Mind ",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  Container(
                    height: 150,
                    child: Image.asset(
                        'assets/images/kipchoge.jpg'), //Text("hello"),
                  ),

                  /*   IconButton(
  icon:Image.asset("assets/icons/facebook_logo1.png",fit:BoxFit.contain,color: Colors.white,),

        onPressed: (){
       Share.share('check out my website https://example.com');
        }),*/
                ],
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
                    /* Text(
                  " The ",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                  ),
                ),*/
                    Container(
                      height: 250,
                      width: 100,
                      child: Image.asset(
                          'assets/images/mars.jpg'), //Text("hello"),
                    ),
                    /* Text(
                  "Technician",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                  ),
                ),*/
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
            /*singleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  height: 250,
                  width: 100,
                  child: Image.asset(
                      'assets/images/kipchoge.jpg'), //Text("hello"),
                ),
                /* Text(
                  " The ",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                  ),
                ),*/
                Container(
                  height: 250,
                  width: 100,
                  child: Image.asset('assets/images/mars.jpg'), //Text("hello"),
                ),
                /* Text(
                  "Technician",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                  ),
                ),*/
                Container(
                  height: 250,
                  width: 100,
                  child: Image.asset(
                      'assets/images/boychild.jpg'), //Text("hello"),
                ),
                //Image.asset('assets/images/background.jpg'), //   <-- image
              ],
            ),
          ),*/
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
            //Center(child: Image.asset('assets/images/kipchoge.jpg')),
            // Center(child: Image.asset('assets/images/mars.jpg'))
          ]),
        ));
  }
}
