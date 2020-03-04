import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  List<GButton> tabs = new List();
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600],
    Colors.teal,
    Colors.lightBlue
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          color: colors[selectedIndex],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        spreadRadius: -10,
                        blurRadius: 60,
                        color: Colors.black.withOpacity(.20),
                        offset: Offset(0, 15))
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: GNav(
                        gap: 8,
                        color: Colors.grey[800],
                        activeColor: Colors.purple,
                        iconSize: 24,
                        // backgroundColor: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        duration: Duration(milliseconds: 800),
                        tabs: [
                          GButton(
                            icon: LineIcons.home,
                            text: 'Home',
                          ),
                          GButton(
                            icon: LineIcons.heart_o,
                            text: 'Likes',
                          ),
                          GButton(
                            icon: LineIcons.search,
                            text: 'Search',
                          ),
                        ],
                        selectedIndex: selectedIndex,
                        onTabChange: (index) {
                          print(index);
                          setState(() {
                            selectedIndex = index;
                          });
                        }),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        spreadRadius: -10,
                        blurRadius: 60,
                        color: Colors.black.withOpacity(.20),
                        offset: Offset(0, 15))
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 22),
                    child: GNav(
                        gap: 10,
                        color: Colors.grey[600],
                        activeColor: Colors.white,
                        iconSize: 20,
                        textStyle: TextStyle(fontSize: 16, color: Colors.white),
                        tabBackgroundColor: Colors.red[300],
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 6.5),
                        duration: Duration(milliseconds: 800),
                        tabs: [
                          GButton(
                            icon: LineIcons.home,
                            text: 'Home',
                          ),
                          GButton(
                            icon: LineIcons.heart_o,
                            text: 'Likes',
                          ),
                          GButton(
                            icon: LineIcons.search,
                            text: 'Search',
                          ),
                          GButton(
                            icon: LineIcons.user,
                            text: 'Profile',
                          )
                        ],
                        selectedIndex: selectedIndex,
                        onTabChange: (index) {
                          print(index);
                          setState(() {
                            selectedIndex = index;
                          });
                        }),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        spreadRadius: -10,
                        blurRadius: 60,
                        color: Colors.black.withOpacity(.20),
                        offset: Offset(0, 15))
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0, vertical: 14),
                    child: GNav(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                        duration: Duration(milliseconds: 800),
                        gap: 8.5,
                        tabs: [
                          GButton(
                            iconActiveColor: Colors.purple,
                            iconColor: Colors.black,
                            textColor: Colors.purple,
                            backgroundColor: Colors.purple.withOpacity(.2),
                            iconSize: 24,
                            icon: LineIcons.home,
                            // textStyle: t.textStyle,
                            text: 'Home',
                          ),
                          GButton(
                            iconActiveColor: Colors.pink,
                            iconColor: Colors.black,
                            textColor: Colors.pink,
                            backgroundColor: Colors.pink.withOpacity(.2),
                            iconSize: 24,
                            icon: LineIcons.heart_o,
                            // textStyle: t.textStyle,
                            text: 'Likes',
                          ),
                          GButton(
                            iconActiveColor: Colors.amber[600],
                            iconColor: Colors.black,
                            textColor: Colors.amber[600],
                            backgroundColor: Colors.amber[600].withOpacity(.2),
                            iconSize: 24,
                            icon: LineIcons.search,
                            // textStyle: t.textStyle,
                            text: 'Search',
                          ),
                          GButton(
                            iconActiveColor: Colors.teal,
                            iconColor: Colors.black,
                            textColor: Colors.teal,
                            backgroundColor: Colors.teal.withOpacity(.2),
                            iconSize: 24,
                            icon: LineIcons.user,
                            // textStyle: t.textStyle,
                            text: 'Profile',
                          )
                        ],
                        selectedIndex: selectedIndex,
                        onTabChange: (index) {
                          print(index);
                          setState(() {
                            selectedIndex = index;
                          });
                        }),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        spreadRadius: -10,
                        blurRadius: 60,
                        color: Colors.black.withOpacity(.20),
                        offset: Offset(0, 15))
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 22),
                    child: GNav(
                        gap: 8,
                        color: Colors.grey[600],
                        activeColor: Colors.white,
                        iconSize: 16,
                        textStyle: TextStyle(fontSize: 12, color: Colors.white),
                        tabBackgroundColor: Colors.grey[800],
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 6.5),
                        duration: Duration(milliseconds: 800),
                        tabs: [
                          GButton(
                            icon: LineIcons.home,
                            text: 'Home',
                          ),
                          GButton(
                            icon: LineIcons.heart_o,
                            text: 'Likes',
                          ),
                          GButton(
                            icon: LineIcons.search,
                            text: 'Search',
                          ),
                          GButton(
                            icon: LineIcons.user,
                            text: 'Profile',
                          ),
                          GButton(
                            icon: LineIcons.gear,
                            text: 'Setting',
                          )
                        ],
                        selectedIndex: selectedIndex,
                        onTabChange: (index) {
                          print(index);
                          setState(() {
                            selectedIndex = index;
                          });
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
