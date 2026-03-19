import 'package:flutter/material.dart';

abstract final class AppConstants {
  static const Color background = Color(0xFF000000);
  static const Color fill = Color(0xFF1C1C1C);
  static const Color accent = Color(0xFFBAFC54);
  static const Color caption = Color(0xFFC5C5C5);
  static const Color title = Color(0xFFFFFFFF);
  static const Color elements = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFA5A5A5);
  static const Color white = Color(0xFFC5C5C5);

  static TextStyle titleStyle() => const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 24,
        height: 1.30,
        letterSpacing: 0,
        color: title,
      );

  static TextStyle subtitleStyle() => const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: 1.30,
        letterSpacing: 0,
        color: title,
      );

  static TextStyle accentStyle() => const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.0,
        letterSpacing: 0,
        color: accent,
      );

  static TextStyle captionStyle() => const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.0,
        letterSpacing: 0,
        color: grey,
      );

  static TextStyle elementsStyle() => const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.0,
        letterSpacing: 0,
        color: grey,
      );
}
