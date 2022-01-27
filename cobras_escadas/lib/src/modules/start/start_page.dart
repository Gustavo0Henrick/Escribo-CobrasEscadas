import 'package:cobras_escadas/src/modules/board/board_page.dart';
import 'package:cobras_escadas/src/themes/app_colors.dart';
import 'package:cobras_escadas/src/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.cyan,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              AppColors.cyan,
              AppColors.green,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cobras e Escadas',
                    style: AppFonts.robotoBold30white),
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => const BoardPage(),
                          ));
                    },
                    child:
                        const Text('Jogar', style: AppFonts.robotoBold22cyan),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
