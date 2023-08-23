import 'dart:io';

void main() async {
  //* 1. Fungsi Asinkronus
  List<double> list = []; // list data

  stdout.write("Masukkan data list (ketik 'ok' jika selesai):\n");
  while (true) {
    String input = stdin.readLineSync()!;
    // proses input data selesai jika user memasukkan 'ok'
    if (input.toLowerCase() == 'ok') break;

    // jika input tidak kosong, masukkan ke list
    if (input != "") list.add(double.parse(input));
  }

  // input nilai pengali
  stdout.write("Masukkan nilai pengali: ");
  int multiplier = int.parse(stdin.readLineSync()!);

  // memasukkan list data dan pengali ke parameter fungsi dan menyimpan ke variabel
  List<double> result = await multiply(list, multiplier);
  stdout.write("List baru: $result");
}

// 1. fungsi yang menerima 2 parameter untuk mengalikan setiap elemen list dengan nilai tertentu secara asynchronous
Future<List<double>> multiply(List<double> list, int multiplier) async {
  List<double> newlist = []; // list baru untuk menampung hasil perkalian

  // perulangan secara asynchronous yang mengalikan elemen list dengan pengali
  for (double el in list) {
    await Future.delayed(Duration(seconds: 1), () {
      // input hasil perkalian ke list baru
      newlist.add(el * multiplier);
      stdout.write("${el * multiplier}\n");
    });
  }

  // return list baru hasil proses perkalian
  return newlist;
}
