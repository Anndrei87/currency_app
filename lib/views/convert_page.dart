import 'package:currency/widgets/body_row.dart';
import 'package:currency/widgets/dropdown.dart';
import 'package:currency/widgets/header_convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

const String title = 'Realize aqui a conversão da moeda desejada para a moeda brasileira';

class ConvertPage extends StatefulWidget {
  const ConvertPage({Key? key}) : super(key: key);

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realize a conversão'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const HeaderConvert(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BodyRow(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


