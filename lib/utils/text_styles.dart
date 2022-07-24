import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle h5 = const TextStyle(
    fontSize: 14.5,
  );

  static TextStyle h4 = const TextStyle(
    fontSize: 15,
    color: Color(0xff5e5873),
    fontWeight: FontWeight.w600,
  );

  static TextStyle pSmallCard = const TextStyle(
    fontSize: 10,
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.w600,
  );
}
