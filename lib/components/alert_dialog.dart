import 'package:currency/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AlertError extends StatelessWidget {
  const AlertError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Visibility(
        child: Text('Ops! Ocorreu um erro'),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Lottie.asset('lottie/error_animated.json', width: 120)
            ),
           const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text( 'Realize conversões para acessar o histórico!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          child: const Text('Confirmar'),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const PageButtom())),
        )
      ],
    );
  }
}


