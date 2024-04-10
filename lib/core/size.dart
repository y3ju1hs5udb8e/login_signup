import 'package:flutter/material.dart';

Widget heightBox({double height = 0}) {
  return SizedBox(
    height: (20 + height),
  );
}

Widget widthBox({double width = 0}) {
  return SizedBox(
    width: (10 + width),
  );
}
