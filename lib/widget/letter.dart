import 'package:flutter/material.dart';
import 'package:flutter_game_ahorcado/colors/colors.dart';

Widget letter(String character, bool ocultar) {
  return Container(
    height: 65,
    width: 50,
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: AppColor.primaryColorDark,
      borderRadius: BorderRadius.circular(4.0),
    ),

    child: Visibility(
      visible: !ocultar,
      child: Text(
        character,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      ),
    ),
  );
}
