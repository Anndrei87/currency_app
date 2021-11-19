import 'dart:async';

import 'package:currency/components/snack_notfoud.dart';
import 'package:currency/components/convert_input.dart';
import 'package:currency/database/app_database.dart';
import 'package:currency/model/statics_price.dart';
import 'package:currency/controller/controller_currency.dart';
import 'package:currency/model/currency_save.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'dropdown.dart';

class BodyRow extends StatefulWidget {
  BodyRow({Key? key}) : super(key: key);

  @override
  State<BodyRow> createState() => _BodyRowState();
}

class _BodyRowState extends State<BodyRow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String valueConvert = ValoresApi.valueConvert.toString();
    final TextEditingController _inputValue = TextEditingController();

    return Column(
      children: [
        TextInputValueAndTypeCurrency(inputValue: _inputValue),
        TextCurrencyConvert(valueConvert: valueConvert),
        const SizedBox(height: 50),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          onPressed: () {
            _save(_inputValue, valueConvert);
          },
          child: const Text('Converter'),
        )
      ],
    );
  }

  void _save(TextEditingController _inputValue, String valueConvert) {
    final double? valor = double.tryParse(_inputValue.text);
    if (valor != null) {
      var uuid = const Uuid();
      String codId = uuid.v4();
      String inputValueFinal = _inputValue.text;

      setState(() {
        _inputValue.text = inputValueFinal;
        valueConvert =
            ControllerConvert(valor).controllerConvert(valor)!;
      });

      Timer(const Duration(seconds: 1), () {
        CurrencySave saveSql;
        saveSql = CurrencySave(
          id: codId,
          nameDrop: ValoresApi.dropdownValue,
          inputValue: inputValueFinal,
          currencyValue: ValoresApi.valueConvert.toString(),
        );
        saveAs(saveSql).catchError((e){
            return const SnackNotFound();
        });
      });

    }
  }
}




