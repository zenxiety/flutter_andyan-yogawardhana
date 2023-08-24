import 'dart:io';

void main() {
  //* E.2. Frekuensi
  List<String> list = [];

  // input data setiap elemen ke list
  stdout.write("Masukkan data list (ketik 'ok' jika selesai):\n");
  while (true) {
    String input = stdin.readLineSync()!;
    // proses input data selesai jika user memasukkan 'ok'
    if (input.toLowerCase() == 'ok') break;

    // jika input tidak kosong, masukkan ke list
    if (input != '') list.add(input);
  }

  // map untuk menyimpan nilai frekuensi setiap elemen
  Map<String, int> test = {};

  // menghilangkan duplikasi pada list input untuk mendaftarkan key setiap elemen ke map untuk menghitung frekuensi
  List<String> distinctList = list.toSet().toList();

  // inisiasi map yang menampung frekuensi setiap elemen
  for (String el in distinctList) test[el] = 0;

  // menghitung frekuensi setiap elemen
  for (String el in list) {
    for (String key in test.keys) {
      // jika ditemukan string yang sama antara input dengan key pada map, maka tambahkan nilai frekuensi dari data tersebut
      if (el == key) {
        test[el] = test[el]! + 1;
        break; // iterasi dilanjutkan ke elemen input berikutnya tanpa membandingkan key selanjutnya
      }
    }
  }

  stdout.write(test);
}
