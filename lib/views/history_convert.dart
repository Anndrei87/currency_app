import 'package:currency/components/alert_dialog.dart';
import 'package:currency/components/snack_notfoud.dart';
import 'package:currency/components/progress.dart';
import 'package:currency/database/app_database.dart';
import 'package:currency/model/currency_save.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryConvert extends StatefulWidget {
  const HistoryConvert({Key? key}) : super(key: key);

  @override
  State<HistoryConvert> createState() => _HistoryConvertState();
}

class _HistoryConvertState extends State<HistoryConvert> {
  ScrollController? _controller;

  @override
  void initState() {
    if(_controller != null ) {
      _controller = ScrollController();
      _controller!.animateTo(100,
          curve: Curves.easeInOutCubic,
          duration: const Duration(milliseconds: 200));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Histórico de conversões'),
        ),
        body: FutureBuilder<List<CurrencySave>>(
          future: findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Unknown error', style: TextStyle(fontSize: 20),),);
                break;
              case ConnectionState.waiting:
                return const Progress();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List? currencys = snapshot.data;
                  if (currencys!.isNotEmpty) {
                    return ListView.builder(
                      controller: _controller,
                      itemBuilder: (context, index) {
                        CurrencySave findCurrency = currencys[index];
                        return SingleChildScrollView(
                          child: Card(
                            child: ListTile(
                              trailing: Text(
                                'R\$' + findCurrency.currencyValue,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Valor inserido: ' +
                                  findCurrency.inputValue +
                                  ' para BRL'),
                              title: Text(
                                findCurrency.nameDrop,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: currencys.length,
                    );
                  }
                }
                break;
            }
            return const AlertError();
          },
        ));
  }
}
