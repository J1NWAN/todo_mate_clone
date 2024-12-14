import 'dart:math';

import 'package:flutter/material.dart';

class CommonColors {
  static Color primaryColor = Colors.grey.shade900;

  static Color secondaryColor = Colors.grey.shade800;

  static Color secondaryColor2 = Colors.grey.shade700;

  static Color blueColor = Colors.blue.shade300;

  static Color yellowColor = Colors.yellow.shade400;

  static Color redColor = Colors.red.shade400;

  static Color randomColor() {
    final random = Random();
    final randomNumber = random.nextInt(5);

    List<Color> colors = [
      Colors.red[300]!,
      Colors.green[300]!,
      Colors.blue[300]!,
      Colors.yellow[300]!,
      Colors.purple[300]!,
    ];
    return colors[randomNumber];
  }
}
