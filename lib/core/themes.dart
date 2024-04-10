import 'package:flutter/material.dart';

//app colors
class AppColor {
  static Color primary = const Color(0xff778BEB);
  static Color textPrimary = const Color(0xff141414);
  static Color textsecondary = const Color(0xff7c7c7c);
  static Color bgColor = const Color(0xffffffff);
}

//app themeData

//text themes
class ThemeText {
  static TextStyle headingDark = const TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headingLight = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: Colors.grey.shade500,
  );

  static TextStyle paragraphDark = const TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w400,
  );

  static TextStyle paragraphLight = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.grey[500],
  );
}
