import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../domain/custom_card.dart';
import 'factory/card_factory.dart';

class CardLocalDataSource {
  Future<Map<String, List<CustomCard>>> getCardList() async {
    String _json =
        await rootBundle.loadString('assets/json/database_mock.json');

    CardFactory _cardFactory = CardFactory();

    Map<String, List<CustomCard>> _cardMapList =
        await compute(_cardFactory, _json);

    return _cardMapList;
  }
}
