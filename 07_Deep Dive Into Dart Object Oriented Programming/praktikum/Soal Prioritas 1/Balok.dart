import 'BangunRuang.dart'; // import class BangunRuang dari file terpisah

// struktur class Balok yang merupakan class turunan dari abstract class BangunRuang
class Balok extends BangunRuang {
  // constructor untuk class Balok yang sekaligus melakukan value assignment ke property object Balok yang sama dengan BangunRuang
  Balok({required double p, required double l, required double t}) {
    super.panjang = p;
    super.lebar = l;
    super.tinggi = t;
  }

  // proses override method volume dari abstract class BangunRuang yang menghasilkan nilai volume Balok
  @override
  double volume() {
    return lebar * panjang * tinggi;
  }
}
