import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class BaseCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const BaseCard({
    Key? key,
    required this.backgroundColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DEVICE_SCREEN_WIDTH * 0.9,
      height: DEVICE_SCREEN_HEIGHT * 0.5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        color: backgroundColor,
        elevation: 10,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      ),
    );
  }
}
