import 'package:flutter/material.dart';

import 'context.dart';

const Map<String, Color> mapColor = {
  "purple": Colors.purple,
  "black": Colors.black,
  "red": Colors.red,
};

final double DEVICE_SCREEN_HEIGHT =
    MediaQuery.of(Context.globalKey.currentContext!).size.height;
final double DEVICE_SCREEN_WIDTH =
    MediaQuery.of(Context.globalKey.currentContext!).size.width;

const Color standardBackgroundColor = Colors.black;

const TextStyle cardMessageTextStyle =
    TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);
