import 'Hewan.dart'; // import class Hewan dari file terpisah

//* 2. Struktur class Mobil
class Mobil {
  double _kapasitas; // property kapasitas yang dapat dibawa mobil
  final List<Hewan> _muatan = []; // property daftar hewan yang dibawa mobil
  double _totalMuatan = 0; // property berat total hewan yang telah dibawa mobil
  String _nama; // property nama mobil

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
    if (hewan.berat + _totalMuatan <= _kapasitas) {
      print("${hewan.nama} dengan berat ${hewan.berat} masuk ke ${_nama}.");
      _muatan.add(hewan);
      _totalMuatan +=
          hewan.berat; // menambahkan berat hewan ke total muatan mobil
    }
    // hewan dengan muatan total yang melebihi kapasitas tidak akan dimasukkan ke mobil
    else {
      print(
          'Kapasitas ${_nama} tidak mencukupi untuk menampung ${hewan.nama} dengan berat ${hewan.berat}.');
    }
  }

  // method untuk menghitung total muatan
  double totalMuatan() => _totalMuatan;

  // getter untuk mendapatkan nama mobil
  String get nama => _nama;
}
