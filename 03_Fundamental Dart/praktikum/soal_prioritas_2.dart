void main() {
  //* 1. Menyambungkan 3 variabel string
  String satu = "one";
  String dua = "two";
  String tiga = "three";
  String gabungan = "$satu $dua $tiga";
  String gabunganOperasi = satu + dua + tiga;
  print(gabungan);
  print(gabunganOperasi);

  //* 2. Volume tabung
  double radius = 2;
  double tinggi = 4.4;
  print("Volume Tabung = ${volumeTabung(radius, tinggi)}");
}

// 2. Tabung
final double PI = 3.14;

// 2. Rumus volume tabung
double volumeTabung(double radius, double tinggi) {
  return PI * radius * radius * tinggi;
}
