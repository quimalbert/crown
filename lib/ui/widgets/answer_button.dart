import 'package:crown/utils/constants.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final bool isYesAnswer;
  final onPressed;

  const AnswerButton({
    Key? key,
    required this.text,
    required this.isYesAnswer,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: DEVICE_SCREEN_WIDTH * 0.2,
        left: DEVICE_SCREEN_WIDTH * 0.2,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: isYesAnswer
              ? [
                  Expanded(
                      child: Text(
                    text,
                    textAlign: TextAlign.left,
                  )),
                  const Icon(Icons.arrow_right),
                ]
              : [
                  const Icon(Icons.arrow_left),
                  Expanded(
                      child: Text(
                    text,
                    textAlign: TextAlign.right,
                  )),
                ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
