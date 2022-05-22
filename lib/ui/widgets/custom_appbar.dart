import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'half_color_icon.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final int churchPoints, peoplePoints, armyPoints, moneyPoints;

  const CustomAppBar({
    Key? key,
    required this.churchPoints,
    required this.peoplePoints,
    required this.armyPoints,
    required this.moneyPoints,
  }) : super(key: key);

  final double _appBarHeight = 75;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.redAccent,
      toolbarHeight: _appBarHeight,
      flexibleSpace: SizedBox(
        height: _appBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HalfColorIcon(
              icon: churchPoints <= 0 || churchPoints > 10
                  ? MdiIcons.skull
                  : MdiIcons.cross,
              points: churchPoints,
            ),
            HalfColorIcon(
              icon: peoplePoints <= 0 || peoplePoints > 10
                  ? MdiIcons.skull
                  : Icons.emoji_people,
              points: peoplePoints,
            ),
            HalfColorIcon(
              icon: armyPoints <= 0 || armyPoints > 10
                  ? MdiIcons.skull
                  : MdiIcons.sword,
              points: armyPoints,
            ),
            HalfColorIcon(
              icon: moneyPoints <= 0 || moneyPoints > 10
                  ? MdiIcons.skull
                  : MdiIcons.currencyUsd,
              points: moneyPoints,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_appBarHeight);
}
