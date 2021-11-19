import 'dart:convert';

import 'package:currency/model/statics_price.dart';
import 'package:currency/http/interceptor/response_interceptor.dart';
import 'package:currency/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class CurrencyWebClient {
  Client client = InterceptedClient.build(
    interceptors: [
      ResponseInterceptor(),
    ],
  );

  late CurrencyModel Eua, Euro, BitCoin;

  getAll() async {
    const String uri = 'https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL';
    final Response response = await client.get(Uri.parse(uri)).catchError((e)=> debugPrint('Bad Request: '+ e.toString()) );


    if(response.statusCode == 200){
      final moeda = jsonDecode(response.body);
      final moedaEua = moeda['USDBRL'];
      final moedaEur = moeda['EURBRL'];
      final moedaBtc = moeda['BTCBRL'];

      if (moedaEua != null) {
        String code = moedaEua['code'];
        String codein = moedaEua['codein'];
        String name = moedaEua['name'];
        String high = moedaEua['high'];
        String low = moedaEua['low'];
        String varBid = moedaEua['varBid'];
        String pctChange = moedaEua['pctChange'];
        String bid = moedaEua['bid'];
        String ask = moedaEua['ask'];
        String timestamp = moedaEua['timestamp'];
        String createDate = moedaEua['create_date'];

        Eua = CurrencyModel(code, codein, name, high, low, varBid, pctChange, bid,
            ask, timestamp, createDate);

        ValoresApi.Eua = Eua;
      }

      if (moedaEur != null) {
        String code = moedaEur['code'];
        String codein = moedaEur['codein'];
        String name = moedaEur['name'];
        String high = moedaEur['high'];
        String low = moedaEur['low'];
        String varBid = moedaEur['varBid'];
        String pctChange = moedaEur['pctChange'];
        String bid = moedaEur['bid'];
        String ask = moedaEur['ask'];
        String timestamp = moedaEur['timestamp'];
        String createDate = moedaEur['create_date'];

        Euro = CurrencyModel(code, codein, name, high, low, varBid, pctChange,
            bid, ask, timestamp, createDate);

        ValoresApi.Euro = Euro;
      }

      if (moedaBtc != null) {
        String codeB = moedaBtc['code'];
        String codeinB = moedaBtc['codein'];
        String nameB = moedaBtc['name'];
        String highB = moedaBtc['high'];
        String lowB = moedaBtc['low'];
        String varBidB = moedaBtc['varBid'];
        String pctChangeB = moedaBtc['pctChange'];
        String bidB = moedaBtc['bid'];
        String askB = moedaBtc['ask'];
        String timestampB = moedaBtc['timestamp'];
        String createDateB = moedaBtc['create_date'];

        BitCoin = CurrencyModel(codeB, codeinB, nameB, highB, lowB, varBidB,
            pctChangeB, bidB, askB, timestampB, createDateB);

        ValoresApi.BitCoin = BitCoin;
      }
    }

    if(response.statusCode == 404){
      throw Exception('Erro: servidor não conseguiu encontrar o recurso solicitado');
    }
    if(response.statusCode == 500){
      throw Exception('Erro: internal server error');
    }
    if(response.statusCode == 504){
      throw Exception('Erro: Gateway Timeout');
    }
  }
}
