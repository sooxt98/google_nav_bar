import 'package:flutter/material.dart';

enum GnavStyle {
  google,
  oldSchool,
}

class GButtonStyle {
  const GButtonStyle({
    Key? key,
    this.backgroundColor = Colors.transparent,
    this.rippleColor = Colors.transparent,
    this.hoverColor = Colors.transparent,
    this.iconColor,
    this.iconActiveColor,
    this.textColor,
    this.padding = const EdgeInsets.all(25),
    this.margin = EdgeInsets.zero,
    this.debug = false,
    this.haptic = true,
    this.gap = 0,
    this.curve = Curves.easeInCubic,
    this.textStyle,
    this.iconSize,
    this.backgroundGradient,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(100),
    ),
    this.border,
    this.activeBorder,
    this.shadow,
    this.semanticLabel,
    this.style = GnavStyle.google,
    this.duration = const Duration(milliseconds: 500),
    this.textSize,
  });

  final bool? debug;
  final bool haptic;

  final double gap;
  final Color? iconColor;
  final Color rippleColor;
  final Color hoverColor;
  final Color? iconActiveColor;
  final Color? textColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final TextStyle? textStyle;
  final double? iconSize;
  final Curve curve;
  final Gradient? backgroundGradient;

  final BorderRadius borderRadius;
  final Border? border;
  final Border? activeBorder;
  final List<BoxShadow>? shadow;
  final String? semanticLabel;
  final GnavStyle? style;
  final double? textSize;
  final Duration duration;
}
