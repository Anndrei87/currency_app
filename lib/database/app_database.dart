import 'package:currency/model/currency_save.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future init() async {
  Database db = await _getDatabase();
  return db;
}

Future<Database> _getDatabase() async {
  var databasesPath = await getDatabasesPath();
  Database db = await openDatabase(
    join(databasesPath, 'currency.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE currencys('
          'id TEXT PRIMARY KEY, '
          'namevalue TEXT,'
          'inputvalue TEXT, '
          'valuecurrency TEXT)');
    },
    version: 1,
  );
  return db;
}
List<CurrencySave> toList(List<Map<String, dynamic>> result) {
  final List<CurrencySave> listCurrency = [];
  for (Map<String, dynamic> row in result) {
    final CurrencySave contact = CurrencySave(
      id: row['id'],
      nameDrop: row['namevalue'],
      currencyValue: row['valuecurrency'],
      inputValue: row['inputvalue']
    );
    listCurrency.add(contact);
  }
  return listCurrency;
}

Future<List<CurrencySave>> findAll() async {
  Database db = await init();
  List<Map<String, dynamic>> result =  await db.query('currencys');
  List<CurrencySave> saveList = toList(result);
  return saveList;
}

Future saveAs(CurrencySave currency) async {
  String linha = 'INSERT INTO currencys(id, namevalue,inputvalue, valuecurrency) VALUES (?,?,?,?)';
  Database db = await init();
  await db.rawInsert(linha, [
    currency.id,
    currency.nameDrop,
    currency.inputValue,
    currency.currencyValue
  ]);
}
