import 'package:currency/model/statics_price.dart';
import 'package:currency/widgets/card_home.dart';
import 'package:currency/components/header_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

     final priceEua = ValoresApi.Eua.bid;
     final priceEur = ValoresApi.Euro.bid;
     final priceBtc = ValoresApi.BitCoin.bid;


    return Column(
        children: [
        const HeaderGenerics(),
        Text(
          'Cotação das Moedas para Real',
          style: GoogleFonts.arsenal(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Abaixo você verá a relação de preços da moeda',
          style: GoogleFonts.arsenal(
            textStyle: const TextStyle(
              fontSize: 17,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 35,
        ),
        CardHome(
            title: 'Dólar',
            price: 'BRL $priceEua ',
            nameMoney: '1\$ para BRL',
            urlImage: 'images/eua.png'),
        CardHome(
            title: 'Euro',
            price: 'BRL $priceEur ',
            nameMoney: '1€ para BRL',
            urlImage: 'images/euro.jpg'),
        CardHome(
            title: 'Bitcoin',
            price: 'BRL ${priceBtc!+'0'} ',
            nameMoney: '1₿ para BRL',
            urlImage: 'images/bitcoin.jpg')
      ]);
  }
}
