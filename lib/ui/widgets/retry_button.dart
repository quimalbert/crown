import 'package:audioplayers/audioplayers.dart';
import 'package:crown/ui/splash_screen.dart';
import 'package:crown/utils/constants.dart';
import 'package:flutter/material.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AudioPlayer.players.values
            .forEach((AudioPlayer audioPlayer) => audioPlayer.stop());

        Navigator.pushNamedAndRemoveUntil(
            context, SplashScreen.routeID, (route) => false);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(BUTTON_COLOR),
        elevation: MaterialStateProperty.all(10),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: const Text(
        'Empezamos de nuevo?',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
