import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardHome extends StatefulWidget {
  const CardHome({
    Key? key,
    required this.price,
    required this.nameMoney,
    required this.urlImage,
    required this.title,
  }) : super(key: key);


  final String title;
  final String price;
  final String nameMoney;
  final String urlImage;

  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    final String test = widget.price.toString();
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.urlImage),
        ),
        title: Text(widget.title),
        subtitle: Text(widget.nameMoney),
        trailing: Text(test),
      ),
    );
  }
}
