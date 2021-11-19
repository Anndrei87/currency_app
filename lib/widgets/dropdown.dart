import 'package:currency/model/statics_price.dart';
import 'package:flutter/material.dart';

class DropWidget extends StatefulWidget {
  const DropWidget({Key? key}) : super(key: key);

  @override
  State<DropWidget> createState() => _DropWidgetState();
}

class _DropWidgetState extends State<DropWidget> {

  final dropList = <String>['Dólar', 'Euro', 'BTC'];
  String selectedValue = ValoresApi.dropdownValue.toString();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue ,
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 1,
        color: Colors.green,
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue  = newValue!;
          ValoresApi.dropdownValue = selectedValue;
        });
      },
      items:dropList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
