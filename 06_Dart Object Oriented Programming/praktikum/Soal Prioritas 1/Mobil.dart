import 'Hewan.dart'; // import class Hewan dari file terpisah

//* 2. Struktur class Mobil
class Mobil {
  double _kapasitas; // property kapasitas yang dapat dibawa mobil
  final List<Hewan> _muatan = []; // property daftar hewan yang dibawa mobil
  final String _nama; // property nama mobil

  // constructor class mobil untuk assign property awal
  Mobil(this._nama, this._kapasitas);

  // getter dan setter untuk kapasitas mobil
  double get kapaistas => _kapasitas;
  set kapasitas(double kapasitas) => _kapasitas = kapasitas;

  // getter untuk muatan yang dibawa mobil
  List<Hewan> get muatan => _muatan;
  // method untuk menambah muatan hewan yang dibawa mobil
  void tambahMuatan(Hewan hewan) {
    // jika berat hewan yang akan ditambahkan tidak melebihi kapasitas, hewan tersebut akan dimasukkan ke list muatan mobil
    if (hewan.berat + totalMuatan() <= _kapasitas) {
      print("${hewan.nama} dengan berat ${hewan.berat} masuk ke ${_nama}.");
      _muatan.add(hewan);
    }
    // hewan dengan muatan total yang melebihi kapasitas tidak akan dimasukkan ke mobil
    else {
      print(
          'Kapasitas ${_nama} tidak mencukupi untuk menampung ${hewan.nama} dengan berat ${hewan.berat}.');
    }
  }

  // method untuk menghitung total muatan
  double totalMuatan() {
    double tm = 0;
    for (Hewan h in _muatan) tm += h.berat;
    return tm;
  }

  void daftarMuatan() {
    print("Daftar Muatan ${_nama}:");
    for (Hewan h in _muatan) print("${h.nama}: ${h.berat}");
  }

  // getter untuk mendapatkan nama mobil
  String get nama => _nama;
}
