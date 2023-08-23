import 'dart:io';

void main() {
  //* 2. Rata-Rata Nilai
  List<int> nilaiList = [];

  // jumlah elemen yang akan dimasukkan ke list
  stdout.write("Jumlah nilai: ");
  int n = int.parse(stdin.readLineSync()!);

  int sum = 0; // jumlah nilai keseluruhan

  // input setiap nilai ke list sekaligus menjumlahkan total nilai
  for (int i = 0; i < n; i++) {
    int nilai = (int.parse(stdin.readLineSync()!));
    nilaiList.add(nilai);
    sum += nilai;
  }

  int mean = (sum / n).ceil(); // perhitungan rata rata dengan pembulatan keatas

  stdout.write("$mean\n");
}
