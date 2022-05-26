import 'package:crown/domain/card_answer.dart';
import 'package:crown/domain/custom_card.dart';
import 'package:crown/ui/widgets/answer_button.dart';
import 'package:crown/ui/widgets/custom_appbar.dart';
import 'package:crown/ui/widgets/game_card.dart';
import 'package:crown/ui/widgets/game_over.dart';
import 'package:crown/ui/widgets/header_text_widget.dart';
import 'package:crown/ui/widgets/retry_button.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

//TODO animated color per als icones quan guanyes / perds punts: https://stackoverflow.com/questions/53520488/how-to-animate-the-color-of-a-raisedbutton-in-flutter
//TODO AFEGIR MUSICA
// ROTMG 1: https://www.youtube.com/watch?v=B8ruRCSC91c
// ROTMG 2: https://www.youtube.com/watch?v=ipk0E1wanl4
// TODO afegir animations: flip card: https://medium.com/flutter-community/flutter-flip-card-animation-eb25c403f371
// TODO afegir app icon, nom i splash screen

class GameScreen extends StatefulWidget {
  static const String routeID = '/game';

  const GameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<CustomCard> _customCardList;

  late int _churchPoints, _peoplePoints, _armyPoints, _moneyPoints;

  bool _isKingDead = false;

  @override
  void initState() {
    _churchPoints = 5;
    _peoplePoints = 5;
    _armyPoints = 5;
    _moneyPoints = 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _customCardList =
        ModalRoute.of(context)!.settings.arguments as List<CustomCard>;

    if (_isKingDead) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: standardBackgroundColor,
          appBar: CustomAppBar(
            churchPoints: _churchPoints,
            peoplePoints: _peoplePoints,
            armyPoints: _armyPoints,
            moneyPoints: _moneyPoints,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GameOverWidget(imagePath: _getGameOverImagePath()),
              const RetryButton(),
            ],
          ),
        ),
      );
    }

    if (_customCardList.isEmpty) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: standardBackgroundColor,
          appBar: CustomAppBar(
            churchPoints: _churchPoints,
            peoplePoints: _peoplePoints,
            armyPoints: _armyPoints,
            moneyPoints: _moneyPoints,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'YOU WIN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 64,
                  color: Colors.white,
                ),
              ),
              RetryButton(),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: standardBackgroundColor,
        appBar: CustomAppBar(
          churchPoints: _churchPoints,
          peoplePoints: _peoplePoints,
          armyPoints: _armyPoints,
          moneyPoints: _moneyPoints,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
              HeaderTextWidget(text: _customCardList.first.message),
              SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.0125),
              GameCard(
                backgroundColor: _customCardList.first.color,
                imagePath: _customCardList.first.imagePath,
              ),
              SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.0125),
              AnswerButton(
                text: _customCardList.first.yesAnswer.message,
                isYesAnswer: true,
                onPressed: () => _updateGame(_customCardList.first.yesAnswer),
              ),
              AnswerButton(
                text: _customCardList.first.noAnswer.message,
                isYesAnswer: false,
                onPressed: () => _updateGame(_customCardList.first.noAnswer),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateGame(CardAnswer _cardAnswer) {
    setState(() {
      _churchPoints += _cardAnswer.churchPoints;
      _peoplePoints += _cardAnswer.peoplePoints;
      _armyPoints += _cardAnswer.armyPoints;
      _moneyPoints += _cardAnswer.moneyPoints;

      _customCardList.removeAt(0);
    });

    _checkPoints();
  }

  void _checkPoints() {
    if (_churchPoints <= 0 ||
        _churchPoints > 10 ||
        _peoplePoints <= 0 ||
        _peoplePoints > 10 ||
        _armyPoints <= 0 ||
        _armyPoints > 10 ||
        _moneyPoints <= 0 ||
        _moneyPoints > 10) {
      setState(() => _isKingDead = true);
    }
  }

  String _getGameOverImagePath() {
    String _imagePath;

    if (_churchPoints <= 0 || _churchPoints > 10) {
      _imagePath = "assets/images/dead_cards/dead_church.png";
    } else if (_peoplePoints <= 0 || _peoplePoints > 10) {
      _imagePath = "assets/images/dead_cards/dead_people.png";
    } else if (_armyPoints <= 0 || _armyPoints > 10) {
      _imagePath = "assets/images/dead_cards/dead_army.png";
    } else {
      _imagePath = "assets/images/dead_cards/dead_money.png";
    }

    return _imagePath;
  }
}
