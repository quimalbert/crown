import 'package:crown/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context, SplashScreen.routeID, (route) => false),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
        elevation: MaterialStateProperty.all(10),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: const Text('RETRY?'),
    );
  }
}
