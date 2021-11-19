import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key, this.message = 'Carregando...'}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(message, style: const TextStyle(fontSize: 20.0),),
          )
        ],
      ),
    );
  }
}