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
    if (input != "") list.add(input);
  }

  // mengubah List ke kumpulan data berupa Set
  // Set harus memiliki elemen yang unik sehingga elemen yang terduplikasi pada List awal akan dihapus
  // setelah Set memiliki elemen yang unik, Set akan dikonversi kembali seperti semula ke bentuk List
  List<String> distinctList = list.toSet().toList();

  stdout.write(distinctList);
}
