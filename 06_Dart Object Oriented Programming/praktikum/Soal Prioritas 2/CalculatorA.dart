// struktur class kalkulator pertama yang menggunakan property constructor
class CalculatorA {
  // menyimpan nilai kedua angka di property
  double _x;
  double _y;

  // constructor kalkulator untuk inisiasi value dari property
  CalculatorA(this._x, this._y);

  // method menggunakan angka langsung dari property class
  double add() => _x + _y; // penjumlahan
  double subtract() => _x - _y; // pengurangan
  double multiply() => _x * _y; // perkalian
  double divide() => _x / _y; // pembagian

  // getter untuk property angka x dan y
  double get x => _x;
  double get y => _y;
}
