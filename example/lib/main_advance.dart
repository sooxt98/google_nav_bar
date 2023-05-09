import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(TabPage());

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedIndex = 0;
  int badge = 0;
  final padding = EdgeInsets.symmetric(horizontal: 18, vertical: 12);
  double gap = 10;

  PageController controller = PageController();

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
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(
            'GoogleNavBar',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
              badge = badge + 1;
            });
          },
          controller: controller,
          itemBuilder: (context, position) {
            return Container(
              color: colors[position],
            );
          },
          itemCount: 4,
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(.4),
                  offset: Offset(0, 25),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
              child: GNav(
                buttonStyle: GButtonStyle(
                  gap: gap,
                  iconActiveColor: Colors.purple,
                  iconColor: Colors.black,
                  textColor: Colors.purple,
                  backgroundColor: Colors.purple.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
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
                    leading: selectedIndex == 1 || badge == 0
                        ? null
                        : Badge(
                            backgroundColor: Colors.red.shade100,
                            label: Text(
                              badge.toString(),
                              style: TextStyle(color: Colors.red.shade900),
                            ),
                            child: Icon(
                              LineIcons.heart,
                              color: selectedIndex == 1
                                  ? Colors.pink
                                  : Colors.black,
                            ),
                          ),
                  ),
                  GButton(
                    index: 2,
                    icon: LineIcons.search,
                    text: 'Search',
                  ),
                  GButton(
                    index: 3,
                    icon: LineIcons.user,
                    leading: CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        'https://sooxt98.space/content/images/size/w100/2019/01/profile.png',
                      ),
                    ),
                    text: 'Sheldon',
                  )
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
