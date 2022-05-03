import 'package:flutter/material.dart';

class AppTextStyle {
  static const String vazirFont = 'Vazir';
  static const String peydaFont = 'Peyda';
  static const Color _defaultColor = Colors.white;

  static const FontWeight _normalFontWeight = FontWeight.normal; // w400
  static const FontWeight _mediumFontWeight = FontWeight.w500;
  static const FontWeight _boldFontWeight = FontWeight.bold; // w700

  static const double _overlineSize = 10;
  static const double _smallSize = 12;
  static const double _mediumSize = 14;
  static const double _buttonSize = 14;
  static const double _standardSize = 16;
  static const double _largeSize = 18;
  static const double _headSize = 22;

  /// base [TextStyle] used for all custom styles
  ///
  static TextStyle _textStyle(double size, FontWeight fontWeight) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: _defaultColor,
      fontFamily: vazirFont,
      height: 2,
    );
  }

  /// # Default Values:
  /// ```dart
  /// color = white
  /// size = 10
  /// fontWeight = normal
  static TextStyle get overline => _textStyle(_overlineSize, _normalFontWeight);

  /// # Default Values:
  /// ```dart
  /// color = white
  /// size = 12
  /// fontWeight = normal
  static TextStyle get small => _textStyle(_smallSize, _normalFontWeight);

  /// # Default Values:
  /// ```dart
  /// color = white
  /// size = 14
  /// fontWeight = normal
  static TextStyle get medium => _textStyle(_mediumSize, _normalFontWeight);

  /// # Default Values:
  /// ```dart
  /// color = white
  /// size = 16
  /// fontWeight = normal
  static TextStyle get standard => _textStyle(_standardSize, _normalFontWeight);

  /// # Default Values:
  /// ```dart
  /// color = white
  /// size = 18
  /// fontWeight = bold
  static TextStyle get large => _textStyle(_largeSize, _boldFontWeight);

  /// # Default Values:
  /// ```dart
  /// color = white
  /// size = 22
  /// fontWeight = normal
  static TextStyle get head => _textStyle(_headSize, _normalFontWeight);

  /// # Default Values:
  /// ```dart
  /// color = white
  /// size = 20
  /// fontWeight = w500
  static TextStyle get button => _textStyle(_buttonSize, _mediumFontWeight);
}