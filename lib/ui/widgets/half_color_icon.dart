import 'package:flutter/material.dart';

class HalfColorIcon extends StatelessWidget {
  final IconData icon;
  final int points;

  const HalfColorIcon({
    Key? key,
    required this.icon,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _colorPercentage = points / 10;
    const Color _backgroundColor = Colors.black;
    const double _size = 50;
    const Color _pointsColor = Colors.yellow;

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, _colorPercentage, 0],
          colors: [
            _backgroundColor,
            _backgroundColor,
            _backgroundColor.withOpacity(0),
          ],
        ).createShader(rect);
      },
      child: SizedBox(
        width: _size,
        height: _size,
        child: Icon(
          icon,
          size: _size,
          color: _pointsColor,
        ),
      ),
    );
  }
}
