import 'Hewan.dart'; // import class Hewan dari file terpisah

void main() {
  // inisiasi object berdasarkan class Hewan dengan nama dan berat
  final Hewan h1 = Hewan("Anjing", 20);
  h1.berat = 40; // implementasi setter untuk berat hewan

  // menampilkan nama dan berat hewan pertama
  print(h1.nama);
  print(h1.berat);
}
