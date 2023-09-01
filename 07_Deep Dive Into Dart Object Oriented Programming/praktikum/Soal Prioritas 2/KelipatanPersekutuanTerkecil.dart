import 'Matematika.dart'; // import class Matematika dari file terpisah

// struktur class KPK yang mengimplementasi class Matematika
class KelipatanPersekutuanTerkecil implements Matematika {
  // private property sebagai parameter method hasil
  late final int _x;
  late final int _y;

  // constructor class KPK untuk assign property x dan y
  KelipatanPersekutuanTerkecil({required int x, required int y})
      : _x = x,
        _y = y;

  // proses override method abstract class Matematika menjadi method untuk mencari KPK dua bilangan
  @override
  int hasil() {
    int _result = 1;

    if (_x == 0 || _y == 0) return 0;

    // iterasi dari 1 hingga menemukan nilai pertama yang dapat dibagi oleh kedua bilangan
    while (true) {
      if (_result % _x == 0 && _result % _y == 0) {
        return _result;
      }
      _result++;
    }
  }

  // getter untuk private property
  int get x => _x;
  int get y => _y;
}
