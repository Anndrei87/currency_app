import 'package:flutter/material.dart';

class SnackNotFound extends StatelessWidget {
  const SnackNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: const Text('Ops! Ocorreu um erro, tente mais tarde'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ));
  }
}
