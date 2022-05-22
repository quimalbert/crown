import 'package:crown/infrastructure/card_local_data_source.dart';
import 'package:crown/ui/game_screen.dart';
import 'package:flutter/material.dart';

import '../domain/custom_card.dart';

class SplashScreen extends StatefulWidget {
  static const String routeID = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Map<String, List<CustomCard>> _cardMapList;

  @override
  void initState() {
    CardLocalDataSource _cardLocalDataSource = CardLocalDataSource();
    _cardLocalDataSource.getCardList().then((value) {
      _cardMapList = value;
      Navigator.pushNamedAndRemoveUntil(
        context,
        GameScreen.routeID,
        (route) => false,
        arguments: _cardMapList["baseCards"],
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
