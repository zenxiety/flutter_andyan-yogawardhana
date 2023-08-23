import 'dart:io';

void main() {
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

  // menghilangkan duplikasi pada list input untuk mendaftarkan frekuensi setiap elemen ke map
  List<String> distinctList = list.toSet().toList();

  // inisiasi map yang menampung frekuensi setiap elemen
  for (String el in distinctList) {
    test[el] = 0;
  }

  // menghitung frekuensi setiap elemen
  for (String el in list) {
    for (String key in test.keys) {
      // jika ditemukan string yang sama antara input dengan key pada map, maka tambahkan nilai frekuensi dari data tersebut
      if (el == key) {
        test[el] = test[el]! + 1;
        break; // lanjut ke elemen input berikutnya tanpa membandingkan key selanjutnya karena sudah ditemukan
      }
    }
  }

  stdout.write(test);
}
