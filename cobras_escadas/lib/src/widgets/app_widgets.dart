import 'package:cobras_escadas/src/modules/start/start_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escribo Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const StartPage(),
    );
  }
}
