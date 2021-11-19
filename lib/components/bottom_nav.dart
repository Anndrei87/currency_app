
import 'package:currency/model/statics_price.dart';
import 'package:currency/views/convert_page.dart';
import 'package:currency/views/history_convert.dart';
import 'package:currency/views/home_page.dart';
import 'package:flutter/material.dart';

class PageButtom extends StatefulWidget {
   const PageButtom({Key? key}) : super(key: key);

  @override
  State<PageButtom> createState() => _PageButtomState();
}

class _PageButtomState extends State<PageButtom> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ConvertPage(),
    HistoryConvert()
  ];

  void _onItemTapped(int index) {
    setState(() {
      ValoresApi.valueConvert = '0.0';
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Conversão',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
        ],
        currentIndex:  _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
