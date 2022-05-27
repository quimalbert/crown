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

const TextStyle cardMessageTextStyle =
    TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);

const Color BACKGROUND_COLOR = Color.fromRGBO(188, 169, 103, 1);

const Color APPBAR_COLOR = Color.fromRGBO(37, 20, 5, 1);

const Color ICON_BACKGROUND_COLOR = Color.fromRGBO(139, 120, 79, 1);

const Color ICON_FILL_COLOR = Color.fromRGBO(249, 244, 193, 1);

const Color BUTTON_COLOR = Color.fromRGBO(249, 244, 193, 1);
