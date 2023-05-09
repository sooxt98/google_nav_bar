import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:google_nav_bar/google_nav_bar.dart';

import 'button.dart';

class GButton extends StatefulWidget {
  final int index;
  final Function? onPressed;
  final String text;
  final IconData icon;
  final Widget? leading;

  const GButton({
    Key? key,
    required this.index,
    required this.icon,
    this.text = '',
    this.leading,
    this.onPressed,
  }) : super(key: key);

  @override
  _GButtonState createState() => _GButtonState();
}

class _GButtonState extends State<GButton> {
  @override
  Widget build(BuildContext context) {
    final gNav = context.gNav!;

    return Semantics(
      label: gNav.buttonStyle.semanticLabel ?? widget.text,
      child: Button(
        textSize: gNav.buttonStyle.textSize,
        style: gNav.buttonStyle.style,
        borderRadius: gNav.buttonStyle.borderRadius,
        border: gNav.buttonStyle.border,
        activeBorder: gNav.buttonStyle.activeBorder,
        shadow: gNav.buttonStyle.shadow,
        debug: gNav.buttonStyle.debug,
        duration: gNav.buttonStyle.duration,
        iconSize: gNav.buttonStyle.iconSize,
        active: widget.index == gNav.selectedIndex,
        onPressed: () {
          if (gNav.buttonStyle.haptic) HapticFeedback.selectionClick();
          widget.onPressed?.call();
          gNav.clickIndex(widget.index);
        },
        padding: gNav.buttonStyle.padding,
        margin: gNav.buttonStyle.margin,
        gap: gNav.buttonStyle.gap,
        color: gNav.buttonStyle.backgroundColor,
        rippleColor: gNav.buttonStyle.rippleColor,
        hoverColor: gNav.buttonStyle.hoverColor,
        gradient: gNav.buttonStyle.backgroundGradient,
        curve: gNav.buttonStyle.curve,
        leading: widget.leading,
        iconActiveColor: gNav.buttonStyle.iconActiveColor,
        iconColor: gNav.buttonStyle.iconColor,
        icon: widget.icon,
        text: Text(
          widget.text,
          style: gNav.buttonStyle.textStyle ??
              TextStyle(
                fontWeight: FontWeight.w600,
                color: gNav.buttonStyle.textColor,
              ),
        ),
      ),
    );
  }
}
