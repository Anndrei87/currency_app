import 'package:currency/widgets/dropdown.dart';
import 'package:flutter/material.dart';

class TextInputValueAndTypeCurrency extends StatefulWidget {
  const TextInputValueAndTypeCurrency({
    Key? key,
    required TextEditingController inputValue,
  }) : _inputValue = inputValue, super(key: key);

  final TextEditingController _inputValue;

  @override
  State<TextInputValueAndTypeCurrency> createState() => _TextInputValueAndTypeCurrencyState();
}

class _TextInputValueAndTypeCurrencyState extends State<TextInputValueAndTypeCurrency> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(
            height: 67.5,
            child: DropWidget(),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 4,
          child: TextFormField(
            controller: widget._inputValue,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              hintText: 'Insira o valor da conversão',
              labelText: 'Valor',
            ),
          ),
        )
      ],
    );
  }
}

class TextCurrencyConvert extends StatelessWidget {
  const TextCurrencyConvert({
    Key? key,
    required this.valueConvert,
  }) : super(key: key);

  final String valueConvert;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.only(top: 24, left: 20),
                child: Text('BRL'))),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(top: 24, left: 2),
            child: Text(
              'Valor em real: R\$ $valueConvert',
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}