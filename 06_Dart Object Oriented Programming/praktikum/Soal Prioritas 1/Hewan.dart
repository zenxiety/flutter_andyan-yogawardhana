// struktur class Hewan
class Hewan {
  double _berat; // property untuk menyimpan berat badan hewan
  String _nama; // property tambahan untuk menyimpan nama hewan

  // constructor class hewan untuk assign property
  Hewan(this._nama, this._berat);

  // getter dan setter untuk berat hewan
  double get berat => _berat;
  set berat(double berat) => _berat = berat;

  // getter dan setter untuk nama hewan
  String get nama => _nama;
  set nama(String nama) => _nama = nama;
}
