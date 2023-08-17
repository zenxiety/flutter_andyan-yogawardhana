import 'dart:io';

void main() {
  //* 1. Kata / Kalimat Palindrom
  String text = stdin.readLineSync()!; // Membaca input user
  cekPalindrom(text);
  String text2 = stdin.readLineSync()!; // Membaca input user
  cekPalindrom(text2);

  //* 2. Faktor Bilangan

  int num =
      int.parse(stdin.readLineSync()!); // Membaca input user sebagai integer
  faktorDari(num);
}

// 1. Fungsi pengecekan palindrom
void cekPalindrom(String text) {
  // Menghilangkan spasi pada teks untuk memeriksa palindrom tanpa memperhatikan spasi
  String newText = text.replaceAll(" ", "");
  // Pointer untuk menganalisis kesamaan huruf
  int i = 0; // Huruf pertama
  int j = newText.length - 1; // Huruf terakhir

  // Pengecekan palindrom dimulai dari kedua ujung huruf pada teks
  while (i <= j) {
    // Jika ditemukan satu saja pasangan huruf yang berbeda, maka terbukti bukan palindrom
    if (newText[i] != newText[j]) {
      print("bukan palindrom\n");
      return;
    }
    i++; // Pointer bergerak ke kanan
    j--; // Pointer bergerak ke kiri
  }

  // Jika setiap pasangan huruf sama, maka terbukti palindrom
  print("palindrom\n");
  return;
}

// 2. Fungsi pencarian faktor bilangan
void faktorDari(int number) {
  // Iterasi dari 1 hingga bilangan itu sendiri
  // Jika i membagi habis bilangan, maka i adalah faktor dari bilangan tersebut
  for (int i = 1; i < number; i++) {
    if (number % i == 0) print(i);
  }
}
