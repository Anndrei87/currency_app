import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

const String _description =
    'A conversão de moedas, também conhecida como taxa de câmbio, funciona da seguinte maneira: toda moeda possui um custo comparado a outra moeda.';

class HeaderGenerics extends StatelessWidget {
  const HeaderGenerics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 320,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Conversor de Moedas.Br',
                      style: GoogleFonts.arsenal(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'images/personal_finance.svg',
                            width: 180,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                          Positioned(
                              width: 190,
                              top: 20,
                              left: 190,
                              child: Text(
                                _description,
                                style: GoogleFonts.arsenal(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                maxLines: 8,
                                overflow: TextOverflow.visible,
                              )),
                          Container()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ],

    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
