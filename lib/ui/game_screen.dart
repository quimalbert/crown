import 'package:crown/domain/card_answer.dart';
import 'package:crown/domain/custom_card.dart';
import 'package:crown/ui/widgets/answer_button.dart';
import 'package:crown/ui/widgets/base_card.dart';
import 'package:crown/ui/widgets/custom_appbar.dart';
import 'package:crown/ui/widgets/game_card.dart';
import 'package:crown/ui/widgets/game_over.dart';
import 'package:crown/ui/widgets/header_text_widget.dart';
import 'package:crown/ui/widgets/retry_button.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

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
  bool _isAnswerPressed = true;

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
          backgroundColor: BACKGROUND_COLOR,
          appBar: CustomAppBar(
            churchPoints: _churchPoints,
            peoplePoints: _peoplePoints,
            armyPoints: _armyPoints,
            moneyPoints: _moneyPoints,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _getGameOverMessage(),
                style: cardMessageTextStyle,
                textAlign: TextAlign.center,
              ),
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
          backgroundColor: BACKGROUND_COLOR,
          appBar: CustomAppBar(
            churchPoints: _churchPoints,
            peoplePoints: _peoplePoints,
            armyPoints: _armyPoints,
            moneyPoints: _moneyPoints,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                '??HAS SUPERADO LA VERSI??N DE PRUEBA!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 64,
                  color: APPBAR_COLOR,
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
        backgroundColor: BACKGROUND_COLOR,
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
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: _isAnswerPressed
                    ? GameCard(
                        backgroundColor: _customCardList.first.color,
                        imagePath: _customCardList.first.imagePath,
                      )
                    : const BaseCard(
                        backgroundColor: ICON_BACKGROUND_COLOR,
                        child: SizedBox(),
                      ),
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

  void _updateGame(CardAnswer _cardAnswer) async {
    setState(() {
      _isAnswerPressed = false;
      _churchPoints += _cardAnswer.churchPoints;
      _peoplePoints += _cardAnswer.peoplePoints;
      _armyPoints += _cardAnswer.armyPoints;
      _moneyPoints += _cardAnswer.moneyPoints;

      _customCardList.removeAt(0);
    });

    await Future.delayed(const Duration(milliseconds: 600));

    setState(() => _isAnswerPressed = true);

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

  String _getGameOverMessage() {
    String _message;

    if (_churchPoints <= 0 || _churchPoints > 10) {
      _message =
          "Un monje os apu??ala mientras dormiis. El reino cae en manos del Papa.";
    } else if (_peoplePoints <= 0 || _peoplePoints > 10) {
      _message =
          "Una multitud sedienta de libertad os masacra en vuestra tentativa de evasi??n.";
    } else if (_armyPoints <= 0 || _armyPoints > 10) {
      _message =
          "El castillo es saqueado, vuestra corte se dispersa y solo os quedan como ??ltimos s??bditos las palomas.";
    } else {
      _message = "La nueva oligarqu??a os envia al exilio.";
    }

    return _message;
  }
}
