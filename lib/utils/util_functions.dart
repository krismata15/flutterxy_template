import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class UtilFunctions {
  static Size menuPositionCalculator(BuildContext context, [double? menuWith]) {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    final Offset position = box!.localToGlobal(Offset.zero);

    String positionType = 'right';
    if (position.dx < MediaQuery.of(context).size.width / 2) {
      positionType = 'left';
    }

    final double menuWidth = menuWith ?? menuMaxWidth(context);

    final double menuPosition = positionType == 'right'
        ? position.dx - menuWidth + 50
        : position.dx / 2;
    return Size(menuPosition, position.dy + (kIsWeb ? 40 : 25));
  }

  static double menuMaxWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.40;

  static MaterialColor generateMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> colors = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, colors);
  }
}
