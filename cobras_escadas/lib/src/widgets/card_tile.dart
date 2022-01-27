import 'package:cobras_escadas/src/themes/app_colors.dart';
import 'package:cobras_escadas/src/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final String player;
  int position;
  final Color color;
  CardTile(
      {Key? key,
      required this.player,
      required this.position,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      height: 80,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.person,
                  color: color,
                  size: 48,
                ),
                Text(player, style: AppFonts.robotoBold18black),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Posição: ',
                  style: AppFonts.robotoBold18black,
                ),
                Text(
                  '$position',
                  style: AppFonts.robotoRegular18black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
