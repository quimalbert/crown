import 'package:crown/ui/widgets/base_card.dart';
import 'package:flutter/material.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BaseCard(
        backgroundColor: Colors.red,
        child: Center(
          child: Text(
            'GAME OVER',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 64,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
