import 'package:currency/views/inicialization_home.dart';
import 'package:currency/model/statics_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'database/app_database.dart';
import 'http/webclient/api.dart';
import 'model/currency_model.dart';

void main() {
  CurrencyWebClient().getAll().then((value) {
    CurrencyModel Eua = ValoresApi.Eua;
    CurrencyModel Euro = ValoresApi.Euro;
    CurrencyModel BitCoin = ValoresApi.BitCoin;
  });
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.green,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const CurrencyApp());
}

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency',
        theme: ThemeData.light(),
        home: const InitializationApp());
  }
}
