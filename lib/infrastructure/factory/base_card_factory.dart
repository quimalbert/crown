import 'package:crown/domain/card_answer.dart';
import 'package:crown/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../domain/custom_card.dart';

class BaseCardFactory {
  List<CustomCard> call(Map<String, dynamic> _baseDialogMap) {
    List<CustomCard> _baseCardList = [];

    for (Map<String, dynamic> _characterMap in _baseDialogMap.values) {
      String _characterName = _characterMap["characterName"];
      String _imagePath = _characterMap["imagePath"];
      String? _color = _characterMap["color"];

      for (Map<String, dynamic> _dialog in _characterMap["dialogs"]) {
        _baseCardList.add(
          CustomCard(
            name: _characterName,
            message: _dialog["message"],
            color: mapColor[_color] ?? Colors.black,
            imagePath: _imagePath,
            yesAnswer: CardAnswer(
              message: _dialog["yes"]["answer"],
              churchPoints: _dialog["yes"]["churchPoints"],
              peoplePoints: _dialog["yes"]["peoplePoints"],
              armyPoints: _dialog["yes"]["armyPoints"],
              moneyPoints: _dialog["yes"]["moneyPoints"],
            ),
            noAnswer: CardAnswer(
              message: _dialog["no"]["answer"],
              churchPoints: _dialog["no"]["churchPoints"],
              peoplePoints: _dialog["no"]["peoplePoints"],
              armyPoints: _dialog["no"]["armyPoints"],
              moneyPoints: _dialog["no"]["moneyPoints"],
            ),
          ),
        );
      }
    }

    _baseCardList.shuffle();

    return _baseCardList;
  }
}
