import 'Matematika.dart'; // import class Matematika dari file terpisah

// struktur class FPB yang mengimplementasi class Matematika
class FaktorPersekutuanTerbesar implements Matematika {
  // private property sebagai parameter method hasil
  late final int _x;
  late final int _y;

  // constructor class FPB untuk assign property x dan y
  FaktorPersekutuanTerbesar({required int x, required int y})
      : _x = x,
        _y = y;

  // proses override method abstract class Matematika menjadi method untuk mencari FPB dua bilangan
  @override
  int hasil() {
    // iterasi dari salah satu nilai terbesar ke 0 hingga menemukan nilai pertama yang dapat dibagi oleh kedua bilangan
    int i = _x > _y ? _x : _y;
    for (i; i >= 0; i--) {
      if (_x % i == 0 && _y % i == 0) return i;
    }
    return 0;
  }

  // getter untuk private property
  int get x => _x;
  int get y => _y;
}
