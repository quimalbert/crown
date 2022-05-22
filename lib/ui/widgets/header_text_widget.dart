import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class HeaderTextWidget extends StatelessWidget {
  final String text;

  const HeaderTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DEVICE_SCREEN_HEIGHT * 0.125,
      width: DEVICE_SCREEN_WIDTH * 0.9,
      child: Center(
        child: AutoSizeText(
          text,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: cardMessageTextStyle,
        ),
      ),
    );
  }
}
