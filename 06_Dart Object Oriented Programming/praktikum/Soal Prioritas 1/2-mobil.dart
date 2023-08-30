import 'Hewan.dart'; // import class Hewan dari file terpisah
import 'Mobil.dart'; // import class Mobil dari file terpisah

void main() {
  // inisiasi object pertama berdasarkan class mobil dengan nama dan kapasitasnya
  final Mobil m1 = Mobil("Mobil A", 50);
  m1.kapasitas = 100; // implementasi setter kapasitas untuk mobil pertama

  // inisiasi object pertama berdasarkan class hewan dengan nama dan beratnya
  final Hewan h1 = Hewan("Kambing", 20);
  h1.berat = 40; // implementasi setter untuk berat hewan pertama
  m1.tambahMuatan(h1); // menambahkan muatan hewan pertama ke mobil pertama

  // inisiasi object hewan kedua dan menambahkan ke muatan mobil pertama
  final Hewan h2 = Hewan("Sapi", 90);
  m1.tambahMuatan(h2);

  // inisiasi object hewan ketiga dan menambahkan ke muatan mobil pertama
  final Hewan h3 = Hewan("Kucing", 10);
  m1.tambahMuatan(h3);

  // total muatan yang telah dibawa mobil pertama
  print("\nTotal Muatan ${m1.nama} = ${m1.totalMuatan()}");
  // daftar muatan hewan yang dibawa mobil pertama
  m1.daftarMuatan();
}
