import 'package:currency/model/statics_price.dart';

class ControllerConvert{
  final double valor;

  ControllerConvert(this.valor);

   String? controllerConvert(double valor) {
    final String nameMoney = ValoresApi.dropdownValue.toString();
    final double? euaPrice = double.tryParse(ValoresApi.Eua.bid.toString());
    final double? euroPrice = double.tryParse(ValoresApi.Euro.bid.toString());
    final double? btcPrice = double.tryParse(ValoresApi.BitCoin.bid.toString());

    if (nameMoney == 'Dólar') {
      var valorConvert = valor * euaPrice!;
      ValoresApi.valueConvert = valorConvert.toString();
      return ValoresApi.valueConvert;
    }
    if (nameMoney == 'Euro') {
      var valorConvert = valor * euroPrice!;
      ValoresApi.valueConvert = valorConvert.toString();
      return ValoresApi.valueConvert;
    }
    if (nameMoney == 'BTC') {
      var valorConvert = valor * btcPrice!;
      ValoresApi.valueConvert = valorConvert.toString();
      return ValoresApi.valueConvert;
    }
  }
}
