import 'package:crown/ui/game_screen.dart';
import 'package:crown/ui/splash_screen.dart';
import 'package:crown/utils/context.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Context.globalKey,
      initialRoute: SplashScreen.routeID,
      routes: {
        SplashScreen.routeID: (context) => const SplashScreen(),
        GameScreen.routeID: (context) => const GameScreen(),
      },
    );
  }
}
