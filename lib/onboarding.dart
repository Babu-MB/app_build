import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_onboarding/widget.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: getDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 650.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      getField('Sign Up', 'assets/kipchoge.jpg',
                          "Get the services to your doorstep"),
                      getField('Services', 'assets/laptop.jpg',
                          "Get the advantage of the services right from any place"),
                      getField('Get Started', 'assets/boychild.png',
                          "Start using our services right now !!!")
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage == _numPages - 1
                    ? Expanded(
                        child: Align(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24.0),
                                  ),
                                ),
                                getButton(_pageController),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getField(String s, String t, String u) {}

  getDecoration() {}
}

indicator(bool bool) {}

getButton(PageController pageController) {}
