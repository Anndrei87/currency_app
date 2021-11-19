import 'package:currency/model/statics_price.dart';

import 'package:currency/model/statics_price.dart';

class CurrencySave {
  String id;
  String nameDrop;
  String inputValue;
  String currencyValue;

  CurrencySave({
    required this.id,
    required this.nameDrop,
    required this.inputValue,
    required this.currencyValue,
  });

  factory CurrencySave.fromJson(Map<String, dynamic> json) {
    CurrencySave cs = CurrencySave(
      id: json["id"],
      nameDrop: json["namevalue"],
      inputValue: json["inputvalue"],
      currencyValue: json["valuecurrency"],
    );
    return cs;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "namevalue": nameDrop,
        "inputvalue": inputValue,
        "valuecurrency": currencyValue,
      };
}
