import 'package:crown/ui/widgets/base_card.dart';
import 'package:flutter/material.dart';

class GameOverWidget extends StatelessWidget {
  final String imagePath;

  const GameOverWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseCard(
        backgroundColor: Colors.black,
        child: Center(
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
