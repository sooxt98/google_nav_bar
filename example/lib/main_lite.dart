import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  List<GButton> tabs = [];
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600]!,
    Colors.teal
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
        duration: Duration(milliseconds: 300),
        color: colors[selectedIndex],
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(.20),
                  offset: Offset(0, 15),
                )
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
              child: GNav(
                buttonStyle: GButtonStyle(
                  gap: 8,
                  iconColor: Colors.grey[800],
                  iconActiveColor: Colors.purple,
                  iconSize: 24,
                  backgroundColor: Colors.purple.withOpacity(0.1),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  duration: Duration(milliseconds: 1000),
                ),
                tabs: [
                  GButton(
                    index: 0,
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    index: 1,
                    icon: LineIcons.heart,
                    text: 'Likes',
                  ),
                  GButton(
                    index: 2,
                    icon: LineIcons.search,
                    text: 'Search',
                  ),
                  GButton(
                    index: 3,
                    icon: LineIcons.user,
                    text: 'Profile',
                  )
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
