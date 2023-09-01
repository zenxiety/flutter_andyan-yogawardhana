import 'BangunRuang.dart'; // import class BangunRuang dari file terpisah

// struktur class Kubus yang merupakan class turunan dari abstract class cBangunRuang
class Kubus extends BangunRuang {
  // property baru yang dimiliki class Kubus dengan late keyword
  late final double _sisi;

  // constructor untuk class Kubus
  Kubus({required double sisi}) : _sisi = sisi;

  // proses override method volume dari abstract class BangunRuang yang menghasilkan nilai volume Kubus
  @override
  double volume() => _sisi * _sisi * _sisi;

  // getter untuk mendapatkan nilai property private sisi
  double get sisi => _sisi;
}
