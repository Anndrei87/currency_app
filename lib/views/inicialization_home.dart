import 'dart:async';

import 'package:currency/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class InitializationApp extends StatefulWidget {
  const InitializationApp({Key? key}) : super(key: key);

  @override
  _InitializationAppState createState() => _InitializationAppState();
}

class _InitializationAppState extends State<InitializationApp>
    with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const PageButtom()));
    });
    controllerAnimation();
  }

  void controllerAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green,
                Colors.green,
                Colors.lightGreenAccent,
              ],
            )
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: [
                  Lottie.asset('lottie/money_rotation.json',
                      width: 300, height: 400),
                   Text(
                    'Conversor de Moedas',
                    style: GoogleFonts.arsenal(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 150,
              height: 5,
              child: LinearProgressIndicator(
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
