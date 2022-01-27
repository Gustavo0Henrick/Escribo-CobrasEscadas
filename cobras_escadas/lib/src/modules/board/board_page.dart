import 'dart:math';

import 'package:cobras_escadas/src/themes/app_colors.dart';
import 'package:cobras_escadas/src/themes/app_fonts.dart';
import 'package:cobras_escadas/src/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  Map<String, double> initialPosition1 = {"bottom": 370, "left": 0};
  Map<String, double> initialPosition2 = {"bottom": 370, "left": 5};
  bool firstPlayer = true;
  int positionBoard1 = 1;
  int positionBoard2 = 1;
  String direction1 = "right";
  String direction2 = "right";
  bool up1 = false;
  bool up2 = false;
  int diceValue = 0;

  void _checkUporNot() {
    var value = positionBoard1 + diceValue;
    String oldPos = positionBoard1.toString().padLeft(2, '0');
    String newPos = value.toString().padLeft(2, '0');
    if (int.parse(newPos[0]) > int.parse(oldPos[0])) {
      up1 = true;
    } else {
      up1 = false;
    }
  }

  Future<void> _showPopUp() async {
    var random1 = Random().nextInt(7);
    random1 == 0 ? random1 = 1 : null;
    diceValue = diceValue + random1;
    var random2 = Random().nextInt(7);
    random2 == 0 ? random2 = 1 : null;
    diceValue = diceValue + random2;

    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
            'Dados',
            style: AppFonts.robotoBold22black,
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Dado A : $random1',
                  style: AppFonts.robotoBold18black,
                ),
                Text(
                  'Dado B : $random2',
                  style: AppFonts.robotoBold18black,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Center(child: Text('Okay')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.cyan,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              AppColors.cyan,
              AppColors.green,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: [
              Image.asset('assets/images/tabuleiro.png'),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
                bottom: initialPosition1['bottom'],
                left: initialPosition1['left'],
                child: const Icon(
                  Icons.person_pin_circle_rounded,
                  color: AppColors.blue,
                  size: 52,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
                bottom: initialPosition2['bottom'],
                left: initialPosition2['left'],
                child: const Icon(
                  Icons.person_pin_circle_rounded,
                  color: AppColors.red,
                  size: 52,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: size.height * 0.3,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: firstPlayer
                                          ? Colors.amber
                                          : AppColors.transparent,
                                      width: 3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: CardTile(
                                  color: AppColors.blue,
                                  player: 'Jogador 1',
                                  position: positionBoard1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: firstPlayer
                                      ? Colors.amber
                                      : AppColors.transparent,
                                  size: 52,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: !firstPlayer
                                          ? Colors.amber
                                          : AppColors.transparent,
                                      width: 3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: CardTile(
                                  color: AppColors.red,
                                  player: 'Jogador 2',
                                  position: positionBoard2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: !firstPlayer
                                      ? Colors.amber
                                      : AppColors.transparent,
                                  size: 52,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () async {
                        print('before: ${initialPosition1['left']}');
                        print('before: $firstPlayer');
                        diceValue = 0;
                        await _showPopUp();
                        setState(() {
                          if (firstPlayer) {
                            _checkUporNot();
                            if (up1) {
                              initialPosition1['bottom'] =
                                  initialPosition1['bottom']! + 40;
                              direction1 == 'right'
                                  ? direction1 = 'left'
                                  : direction1 = 'right';
                            }
                            initialPosition1['left'] = direction1 == 'right'
                                ? initialPosition1['left']! + (40.0 * diceValue)
                                : initialPosition1['left']! -
                                    (40.0 * diceValue);
                            positionBoard1 = positionBoard1 + diceValue;
                          } else {
                            initialPosition2['left'] =
                                initialPosition2['left']! + (40.0 * diceValue);
                            positionBoard2 = positionBoard2 + diceValue;
                          }
                          firstPlayer = !firstPlayer;
                        });
                        print('after: ${initialPosition1['left']}');
                        print('after: $firstPlayer');
                      },
                      child: const Text(
                        'Rolar Dados',
                        style: AppFonts.robotoBold22cyan,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
