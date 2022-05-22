import 'package:crown/ui/widgets/base_card.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;

  const GameCard({
    Key? key,
    required this.backgroundColor,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      backgroundColor: backgroundColor,
      child: Image.asset(imagePath),
    );
  }
}
