library google_nav_bar;

import 'package:flutter/material.dart';

class GNav extends StatefulWidget {
  GNav({Key key, this.tabs, this.selectedIndex = 0, this.onTabChange});

  final List<GButton> tabs;
  final int selectedIndex;
  final Function onTabChange;

  @override
  _GNavState createState() => _GNavState();
}

class _GNavState extends State<GNav> {
  int selectedIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.selectedIndex;

    return Container(
        // padding: EdgeInsets.all(12),
        // alignment: Alignment.center,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.tabs
                .map((t) => GButton(
                      active: selectedIndex == widget.tabs.indexOf(t),
                      gap: t.gap,
                      iconActiveColor: t.iconActiveColor,
                      iconColor: t.iconColor,
                      iconSize: t.iconSize,
                      textColor: t.textColor,
                      padding: t.padding,
                      textStyle: t.textStyle,
                      text: t.text,
                      icon: t.icon,
                      color: t.color,
                      onPressed: () {
                        setState(() {
                          selectedIndex = widget.tabs.indexOf(t);
                          widget.onTabChange(selectedIndex);
                        });
                      },
                    ))
                .toList()));
  }
}

class GButton extends StatefulWidget {
  final bool active;
  final double gap;
  final Color iconColor;
  final Color iconActiveColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final double iconSize;
  final Function onPressed;
  final String text;
  final IconData icon;
  final Color color;

  GButton(
      {Key key,
      this.active,
      this.color,
      this.icon,
      this.iconColor,
      this.iconActiveColor,
      this.text,
      this.textColor,
      this.padding,
      this.gap,
      this.textStyle,
      this.iconSize,
      this.onPressed});

  @override
  _GButtonState createState() => _GButtonState();
}

class _GButtonState extends State<GButton> {
  @override
  Widget build(BuildContext context) {
    return Button(
      active: widget.active,
      onPressed: () {
        widget.onPressed();
      },
      padding: widget.padding,
      gap: widget.gap,
      color: widget.color,
      icon: Icon(widget.icon,
          color: widget.active ? widget.iconActiveColor : widget.iconColor,
          size: widget.iconSize),
      text: Text(
        widget.text,
        style: widget.textStyle ??
            TextStyle(fontWeight: FontWeight.w600, color: widget.textColor),
      ),
    );
  }
}

class Button extends StatefulWidget {
  Button(
      {Key key,
      this.icon,
      this.text,
      this.gap = 0,
      this.color,
      this.onPressed,
      this.padding = const EdgeInsets.all(25),
      this.margin = const EdgeInsets.all(0),
      this.active = false})
      : super(key: key);

  final Widget icon;
  final Widget text;
  final Color color;
  final double gap;
  final bool active;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  bool _expanded;

  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _expanded = widget.active;

    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
        parent: expandController,
        curve: Cubic(0.25, 1.03, 0.31, 0.92),
        // reverseCurve: Cubic(0.49, 0.04, 0.23,-0.16)
        // reverseCurve: Cubic(8, 4, 0, 100).flipped
        reverseCurve: Cubic(0.77, 0.67, 0, 10).flipped
        // reverseCurve: Cubic(5, 10, 0, 10).flipped
        // reverseCurve: Cubic(0.17, 0.59, 0,0.1),
        // reverseCurve: Cubic(0.17, 0.59, 0, 0.32),
        // reverseCurve: Cubic(0.61, 0.01, 0.34,-0.24),
        // reverseCurve: Cubic(0.48, 0, 0.35,-0.17),
        // reverseCurve: Cubic(0.5, 0.03, 0.41,-0.35),
        // reverseCurve: Cubic(0.39,-0.03, 0.6,-0.13),

        // reverseCurve: Cubic(0.39,-0.03, 0.22,-0.1)
        // reverseCurve: Cubic(0.35,-0.01, 0.23,-0.16)
        // reverseCurve: Cubic(0.74, 0.26, 0.58, 0.13)
        // reverseCurve: Curves.easeInQuad

        // curve: Cubic(.58,0.99,.40,1),
        // reverseCurve: Cubic(.10, .20, 0.20, 0.20),
        // reverseCurve: Cubic(0.21, 0.30, 0.30, 0.40),
        // reverseCurve: Cubic(0.21, 0.30, 0.20, 0.40),
        // reverseCurve: Cubic(0.31, 0.15, 0.07,-0.08),
        // reverseCurve: Cubic(0.22, 0.35, 0, 0.15),
        // reverseCurve: Cubic(0.15, 0.3, 0.04, 0.13),
        // reverseCurve: Cubic(0.55, 0.07, 0.21,-0.04),
        // reverseCurve: Cubic(0.21, 0.30, 0.20, 0.40),
        // reverseCurve: Cubic(0.24, 0.76, 0.13, 0.66),
        // reverseCurve: Cubic(0.18, 0.51, 0.29, 0.63),
        // reverseCurve: Cubic(0.6, 0, 0.42000000000000004, 0.010000000000000009),
        // reverseCurve: Cubic(0.35, 0.02, 0.37, 0.01),
        // curve: _expanded ? Curves.easeOut : Curves.fastOutSlowIn,
        // curve: _expanded ? Curves.easeOutSine : Curves.easeInOutCirc,
        // curve: _expanded ? Curves.easeInOutCirc : Curves.easeOutSine,
        // curve: _expanded ? Curves.fastOutSlowIn : Curves.easeOut,
        );
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _expanded = !widget.active;
    if (_expanded)
      expandController.reverse();
    else
      expandController.forward();
    // final BuildContext context = key.currentContext;

    //Error: The getter 'context' was called on null.
    // final RenderBox iconBox = iconKey.currentContext?.findRenderObject();

    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedContainer(
        // padding: EdgeInsets.symmetric(horizontal: 5),
        padding: widget.padding,
        curve: Curves.easeOutQuad,
        duration: Duration(milliseconds: 500),
        margin: widget.margin,
        decoration: BoxDecoration(
            color: _expanded ? widget.color.withOpacity(0) : widget.color,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Stack(overflow: Overflow.visible, children: <Widget>[
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: widget.padding,
                // height: iconBox?.size?.height ?? 50,
                // width: iconBox?.size?.width ?? 50,
                // color: Colors.red.withOpacity(.2),
                child: widget.icon,
              ),
            ],
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    // color: Colors.red,
                    width: 0,
                    padding: widget.padding,
                    child: widget.icon),
                Column(
                  mainAxisSize: MainAxisSize.min,

                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizeTransition(
                      axis: Axis.horizontal,
                      axisAlignment: 1,
                      sizeFactor: animation,
                      child: AnimatedOpacity(
                        opacity: _expanded ? 0.0 : 1.0,
                        curve:
                            _expanded ? Curves.easeOutExpo : Curves.easeInQuad,
                        duration: Duration(milliseconds: 300),
                        child: Container(
                            // height: 40,
                            padding: widget.padding,
                            margin: EdgeInsets.only(left: widget.gap),
                            // duration: Duration(seconds: 1),
                            alignment: Alignment.centerRight,
                            // duration: Duration(seconds: 1),
                            // width: 200,
                            child: widget.text
                            // duration: Duration(seconds: 1),
                            // height: 50,
                            // color: Colors.blue
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
