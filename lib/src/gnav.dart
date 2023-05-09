import 'package:flutter/material.dart';
import 'package:google_nav_bar/src/gbutton_style.dart';

extension GNavContext on BuildContext {
  /// GNav
  GNavState? get gNav => GNav.of(this);
}

class GNav extends StatefulWidget {
  const GNav({
    Key? key,
    required this.tabs,
    this.onTabChange,
    this.selectedIndex = 0,
    this.backgroundColor = Colors.transparent,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.buttonStyle = const GButtonStyle(),
  }) : super(key: key);

  final List<Widget> tabs;
  final int selectedIndex;
  final ValueChanged<int>? onTabChange;
  final Color backgroundColor;
  final MainAxisAlignment mainAxisAlignment;
  final GButtonStyle buttonStyle;

  @override
  GNavState createState() => GNavState();

  /// static function to provide the drawer state
  static GNavState? of(BuildContext context) {
    return context.findAncestorStateOfType<State<GNav>>() as GNavState?;
  }
}

class GNavState extends State<GNav> {
  late int selectedIndex;

  late final buttonStyle = widget.buttonStyle;
  bool clickable = true;

  // Animation only
  Future<void> animateTo(int toIndex) async {
    setState(() {
      selectedIndex = toIndex;
    });
  }

  // Fire click event
  Future<void> clickIndex(int toIndex) async {
    if (!clickable) return;
    setState(() {
      selectedIndex = toIndex;
      clickable = false;
    });

    widget.onTabChange?.call(selectedIndex);

    Future.delayed(widget.buttonStyle.duration, () {
      setState(() {
        clickable = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(GNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      selectedIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: widget.tabs,
      ),
    );
  }
}
