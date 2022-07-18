/*
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  final int numberOfDots;

  const ThirdPage({Key key, this.numberOfDots = 3}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with TickerProviderStateMixin {
  List<AnimationController> _animationControllers;

  // ignore: deprecated_member_use
  List<Animation<double>> _animations = List();

  int animationDuration = 200;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.numberOfDots, (index) {
            //AnimatedBuilder widget will rebuild it self when
            //_animationControllers[index] value changes.
            return AnimatedBuilder(
              animation: _animationControllers[index],
              builder: (context, child) {
                return Container(
                  padding: EdgeInsets.all(2.5),
                  //Transform widget's translate constructor will help us to move the dot
                  //in upward direction by changing the offset of the dot.
                  //X-axis position of dot will not change.
                  //Only Y-axis position will change.
                  child: Transform.translate(
                    offset: Offset(0, _animations[index].value),
                    child: DotWidget(),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _initAnimation() {
    ///initialization of _animationControllers
    ///each _animationController will have same animation duration
    _animationControllers = List.generate(
      widget.numberOfDots,
      (index) {
        return AnimationController(
            vsync: this, duration: Duration(milliseconds: animationDuration));
      },
    ).toList();

    ///initialization of _animations
    ///here end value is -20
    ///end value is amount of jump.
    ///and we want our dot to jump in upward direction
    for (int i = 0; i < widget.numberOfDots; i++) {
      _animations.add(
          Tween<double>(begin: 0, end: -20).animate(_animationControllers[i]));
    }

    for (int i = 0; i < widget.numberOfDots; i++) {
      _animationControllers[i].addStatusListener((status) {
        //On Complete
        if (status == AnimationStatus.completed) {
          //return of original postion
          _animationControllers[i].reverse();
          //if it is not last dot then start the animation of next dot.
          if (i != widget.numberOfDots - 1) {
            _animationControllers[i + 1].forward();
          }
        }
        //if last dot is back to its original postion then start animation of the first dot.
        // now this animation will be repeated infinitely
        if (i == widget.numberOfDots - 1 &&
            status == AnimationStatus.dismissed) {
          _animationControllers[0].forward();
        }
      });
    }

    //trigger animtion of first dot to start the whole animation.
    _animationControllers.first.forward();
  }
}

DotWidget() {}
 
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const ThirdPage());
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key, String data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search trials'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            /* Container(
              child: Image.asset('assets/images/tools.jpg'), //   <-- image
              // width: size.width = 0.25,
            ),
            const SizedBox(
              height: 20,
            ),*/
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundUsers[index]['name']),
                          subtitle: Text(
                              '${_foundUsers[index]["age"].toString()} years old'),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
