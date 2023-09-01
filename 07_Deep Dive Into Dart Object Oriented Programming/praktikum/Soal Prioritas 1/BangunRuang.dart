// struktur class BangunRuang sebagai abstract class parent dari inheritance bangun ruang turunannya
abstract class BangunRuang {
  // property yang dimiliki class BangunRuang dengan late keyword
  late final double lebar;
  late final double panjang;
  late final double tinggi;

  // method volume sebagai template untuk class turunan yang melakukan extend terhadap BangunRuang
  void volume() {}
}
