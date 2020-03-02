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
    Colors.teal
  ];

  @override
  void initState() {
    super.initState();

    var padding = EdgeInsets.symmetric(horizontal: 20, vertical: 5);
    double gap = 5;

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.purple,
      iconColor: Colors.black,
      textColor: Colors.purple,
      backgroundColor: Colors.purple.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.home,
      // textStyle: t.textStyle,
      text: 'Home',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.pink,
      iconColor: Colors.black,
      textColor: Colors.pink,
      backgroundColor: Colors.pink.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.heart_o,
      // textStyle: t.textStyle,
      text: 'Likes',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.amber[600],
      iconColor: Colors.black,
      textColor: Colors.amber[600],
      backgroundColor: Colors.amber[600].withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.search,
      // textStyle: t.textStyle,
      text: 'Search',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.teal,
      iconColor: Colors.black,
      textColor: Colors.teal,
      backgroundColor: Colors.teal.withOpacity(.2),
      iconSize: 24,
      padding: padding,
      icon: LineIcons.user,
      // textStyle: t.textStyle,
      text: 'Profile',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          color: colors[selectedIndex],
          child: Center(
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(.20),
                    offset: Offset(0, 15))
              ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
                child: GNav(
                    tabs: tabs,
                    selectedIndex: selectedIndex,
                    onTabChange: (index) {
                      print(index);
                      setState(() {
                        selectedIndex = index;
                      });
                    }),
              ),
            ),
          ),
        ));
  }
}
