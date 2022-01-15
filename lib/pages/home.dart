import 'package:flutter/material.dart';
import 'package:flutter_game_ahorcado/colors/colors.dart';
import 'package:flutter_game_ahorcado/pages/game.dart';
import 'package:flutter_game_ahorcado/widget/figure_image.dart';
import 'package:flutter_game_ahorcado/widget/letter.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String word = "Flutter".toUpperCase();
  // creamos un lista contada del alfabeto
  List<String> alfabeto = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "Ñ",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
          title: Text("AHORCADO"),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColor.primaryColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(Game.intentos >= 0, "assets/images/hang.png"),
                figureImage(Game.intentos >= 1, "assets/images/head.png"),
                figureImage(Game.intentos >= 2, "assets/images/body.png"),
                figureImage(Game.intentos >= 3, "assets/images/ra.png"),
                figureImage(Game.intentos >= 4, "assets/images/la.png"),
                figureImage(Game.intentos >= 5, "assets/images/rl.png"),
                figureImage(Game.intentos >= 6, "assets/images/ll.png"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: const EdgeInsets.all(8.0),
              children: alfabeto.map((e) {
                return RawMaterialButton(
                  //crearemso la logica del juego
                  onPressed: Game.selectedChar.contains(e)
                      ? null//primero verificamos que no hayamos seleccionado el botón antes
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.intentos++;
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),

                  child: Text(
                    e,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  fillColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : Colors.blue,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
