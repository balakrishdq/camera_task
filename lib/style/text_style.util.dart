import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  TextStyle primary({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
    List<FontFeature>? fontFeatures,
    Color? decorationColor,
    Paint? foreground,
    Locale? locale,
  }) {
    return GoogleFonts.quicksand(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      fontFeatures: fontFeatures,
      foreground: foreground,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      locale: locale,
    );
  }

  TextStyle creative({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
    List<FontFeature>? fontFeatures,
    Color? decorationColor,
    Paint? foreground,
    Locale? locale,
  }) {
    return GoogleFonts.monoton(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      fontFeatures: fontFeatures,
      foreground: foreground,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      locale: locale,
    );
  }
}
