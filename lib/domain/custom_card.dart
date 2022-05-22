import 'dart:ui';

import 'package:crown/domain/card_answer.dart';

class CustomCard {
  final String name;
  final String message;
  final Color color;
  final String imagePath;
  final CardAnswer yesAnswer;
  final CardAnswer noAnswer;

  CustomCard({
    required this.name,
    required this.message,
    required this.color,
    required this.imagePath,
    required this.yesAnswer,
    required this.noAnswer,
  });
}
