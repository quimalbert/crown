import 'package:audioplayers/audioplayers.dart';
import 'package:crown/infrastructure/card_local_data_source.dart';
import 'package:crown/ui/game_screen.dart';
import 'package:crown/utils/constants.dart';
import 'package:flutter/material.dart';

import '../domain/custom_card.dart';

class SplashScreen extends StatefulWidget {
  static const String routeID = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AudioPlayer _advancedPlayer;
  late AudioCache _audioCache;

  late Map<String, List<CustomCard>> _cardMapList;

  @override
  void initState() {
    _playAudio().then((value) {
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
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Loading cards',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: APPBAR_COLOR,
                ),
              ),
              SizedBox(width: DEVICE_SCREEN_WIDTH * 0.1),
              const CircularProgressIndicator(color: APPBAR_COLOR),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _playAudio() async {
    _advancedPlayer = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _advancedPlayer);

    String _audioPath = 'audio/background_music.mp3';

    _audioCache.loop(_audioPath);
  }
}
