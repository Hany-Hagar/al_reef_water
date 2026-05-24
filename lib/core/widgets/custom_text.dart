// ignore_for_file: deprecated_member_use

import '../utils/styles.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Type? type;
  final double size;
  final Color? color;
  final FontOpacity? opacity;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? letterSpacing;
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.type,
    this.opacity,
    this.height,
    this.maxLines,
    this.textAlign,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: _setStyle(
        size: size,
        height: height,
        type: type ?? Type.medium,
        letterSpacing: letterSpacing,
        opacity: opacity ?? FontOpacity.high,
        color: color ?? Theme.of(context).hintColor,
      ),
    );
  }

  TextStyle _setStyle({
    required Type type,
    required double size,
    required Color color,
    required double? height,
    required FontOpacity opacity,
    required double? letterSpacing,
  }) {
    TextStyle style;
    switch (type) {
      case Type.header:
        style = Styles.textStyle800;
        break;
      case Type.overMedium:
        style = Styles.textStyle700;
        break;
      case Type.medium:
        style = Styles.textStyle600;
        break;
      case Type.overSmall:
        style = Styles.textStyle400;
        break;
      case Type.small:
        style = Styles.textStyle100;
        break;
    }
    return style.copyWith(
      fontSize: size,
      height: height,
      letterSpacing: letterSpacing,
      color: _setColor(color: color, opacity: opacity),
    );
  }
}

Color _setColor({required FontOpacity opacity, required Color color}) {
  Color fColor;
  switch (opacity) {
    case FontOpacity.high:
      fColor = color;
      break;
    case FontOpacity.medium:
      fColor = color.withOpacity(0.7);
      break;
    case FontOpacity.overLow:
      fColor = color.withOpacity(0.4);
      break;
    case FontOpacity.low:
      fColor = color.withOpacity(0.2);

      break;
  }
  return fColor;
}

enum Type { header, overMedium, medium, overSmall, small }

enum FontOpacity { high, medium, overLow, low }
