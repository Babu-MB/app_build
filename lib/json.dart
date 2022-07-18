import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:listviewjsondemo/welcome.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Services offered'),
        ),
        body: Center(
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
                              /*Container(
                                height: 60,
                                width: 60,
                                child: Image.asset(newData[index]['img']),
                              ),*/
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  newData[index]['title'],
                                  //'Note Title',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Text(
                                newData[index]['text'],
                                //'Note Text',

                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                          //SizedBox(width: 20),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            },
          ),
        ));
  }
}
