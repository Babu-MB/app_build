import 'dart:convert';

//import 'dart:js_util';

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/first.dart';

import 'package:myapp/json.dart';

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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  List persons = [];
  List original = [];
  TextEditingController txtQuery = new TextEditingController();

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/persons.json');
    var json = jsonDecode(jsonStr);
    persons = json;
    original = json;
    setState(() {});
  }

  void search(String query) {
    if (query.isEmpty) {
      persons = original;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    print(query);
    List result = [];
    persons.forEach((p) {
      var name = p["name"].toString().toLowerCase();
      if (name.contains(query)) {
        result.add(p);
      }
    });

    persons = result;
    setState(() {});
  }

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
                    if (customIcon.icon == Icons.search) {
                      // Perform set of instructions.

                      customIcon = Icon(Icons.cancel);
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
                        /* TextFormField(
                          controller: txtQuery,
                          onChanged: search,
                          decoration: InputDecoration(
                            hintText: "Search",
                            /* border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0)),*/
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            // prefixIcon: Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                txtQuery.text = '';
                                search(txtQuery.text);
                              },
                            ),
                          ),
                        ),*/
                      );
                    } else {
                      customIcon = Icon(Icons.search);
                      customSearchBar = Text('Technician');
                    }
                  });
                },
              ),
              /* CircleAvatar(
                  radius: (20),
                  backgroundColor: Colors.white60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/boychild.jpg'),
                  )),*/
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home_repair_service),
                ),
                Tab(
                  icon: Icon(Icons.sell_outlined),
                ),
                Tab(
                  icon: Icon(
                    Icons.settings_applications,
                  ),
                )
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                /*const DrawerHeader(
                  /*decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/tools.jpg"), //   <-- image
                      fit: BoxFit.cover,
                    ),
                  ),*/
                  

                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                ),*/

                Container(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                  height: 100,
                  width: 150,
                ),
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      radius: (20),
                      backgroundColor: Colors.white60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/boychild.jpg'),
                      )),
                  /*Icon(
                    Icons.potrait,
                    color: Colors.black,
                  ),*/
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  title: Text("Profile"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Demo()));
                  },
                  leading: Icon(
                    Icons.electrical_services,
                    color: Colors.black,
                  ),
                  title: Text("Services"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: Text("Settings"), //inbox
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  title: Text("Help"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                    color: Colors.black,
                  ),
                  title: Text("About"),
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
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text("Log out"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Center(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/loadjson/details.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var newData = json.decode(snapshot.data.toString());

                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 32, bottom: 32, left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      newData[index]['title'],
                                      //'Note Title',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Text(
                                    newData[index]['text'],
                                    //'Note Text',
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              //SizedBox(width: 20),
                              Container(
                                height: 80,
                                width: 80,
                                child: Image.asset(newData[index]['img']),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: newData == null ? 0 : newData.length,
                  );
                },
              ),
            ),
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
                    "Price: Ksh 1000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'IndieFlower',
                    ),
                  ),

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

            /*Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: StaggeredGridView.count(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 6,

                  // shrinkWrap: true,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  staggeredTiles: [
                    StaggeredTile.count(4, 2),
                    // StaggeredTile.count(4, 2),
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
                    // myPhotoList('assets/images/boychild.jpg'),
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
              ),
            ),*/
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
}
