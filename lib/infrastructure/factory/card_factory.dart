import 'dart:convert';

import 'package:crown/domain/custom_card.dart';
import 'package:crown/infrastructure/factory/base_card_factory.dart';
import 'package:crown/infrastructure/factory/dead_card_factory.dart';
import 'package:crown/infrastructure/factory/initial_card_factory.dart';

class CardFactory {
  Map<String, List<CustomCard>> call(dynamic json) {
    Map<String, dynamic> _dialogMap = jsonDecode(json);

    BaseCardFactory _baseCardFactory = BaseCardFactory();
    DeadCardFactory _deadCardFactory = DeadCardFactory();
    InitialCardFactory _initialCardFactory = InitialCardFactory();

    List<CustomCard> _baseCards = _baseCardFactory(_dialogMap["baseCards"]);
    List<CustomCard> _deadCards = _deadCardFactory(_dialogMap["deadCards"]);
    List<CustomCard> _initialCards =
        _initialCardFactory(_dialogMap["initialCards"]);

    Map<String, List<CustomCard>> _cardsMap = {
      "baseCards": _baseCards,
      "deadCards": _deadCards,
      "initialCards": _initialCards
    };

    return _cardsMap;
  }
}
