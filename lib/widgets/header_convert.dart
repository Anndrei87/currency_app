import 'package:currency/views/convert_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderConvert extends StatelessWidget {
  const HeaderConvert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SvgPicture.asset(
              'images/currency_convert.svg',
              width: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                  width: 300,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: GoogleFonts.arsenal(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            )],
        ),
      ),
    );
  }
}