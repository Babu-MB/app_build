import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';

import './login.dart';

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  void callForLoop() {
    for (int i = 0; i <= 10; i++) {
      print('For Loop Called $i Times');
    }
  }

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
  ];
  @override
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

              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                    onPressed: () => callForLoop(),
                    child: Text('Call For Loop'),
                    /*textColor: Colors.white,
                        child: Colors.lightBlue,
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),*/
                  )),
              DropdownButton(
                // Initial Value

                value: dropdownvalue,

                // Down Arrow Icon

                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items

                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),

                // After selecting the desired option,it will

                // change button value to selected value

                onChanged: (String newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                  });
                },
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
              Image.asset('assets/images/tools.jpg'),

              Image.asset(
                "assets/gifs/phone.gif",
                height: 200.0,
                width: 200.0,
              ), //   <-- image
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
          )),
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

void setState(Null Function() param0) {}

/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './second.dart';
import './login.dart';

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
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

  @override
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
              TextFormField(
                controller: txtQuery,
                onChanged: search,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      txtQuery.text = '';
                      search(txtQuery.text);
                    },
                  ),
                ),
              ),
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
              Image.asset('assets/images/tools.jpg'),
              Image.asset(
                "assets/gifs/phone.gif",
                height: 200.0,
                width: 200.0,
              ), //   <-- image
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
          )),
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

void setState(Null Function() param0) {}
// ignore: unused_element
Widget _listView(persons) {
  return Expanded(
    child: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          var person = persons[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(person['name'][0]),
            ),
            title: Text(person['name']),
            subtitle: Text("City: " + person['city']),
          );
        }),
  );
}*/
