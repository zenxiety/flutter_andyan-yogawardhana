import 'dart:io';

void main() {
  //* 2.2. Rata-Rata Nilai
  List<int> nilaiList = [];
  int sum = 0; // jumlah nilai keseluruhan

  // input setiap elemen nilai
  stdout.write("Masukkan data list (ketik 'ok' jika selesai):\n");
  while (true) {
    String input = stdin.readLineSync()!;
    // proses input data selesai jika user memasukkan 'ok'
    if (input.toLowerCase() == 'ok') break;

    // jika input tidak kosong, masukkan ke list
    if (input != "") {
      int inputInt = int.parse(input);
      nilaiList.add(inputInt);
      sum += inputInt; // tambahkan nilai saat ini ke jumlah nilai
    }
  }

  // perhitungan rata rata dengan pembulatan keatas
  int mean = (sum / nilaiList.length).ceil();

  stdout.write("$mean\n");
}
