import 'dart:io';

void main() {
  //* 1. Looping
  //* 1.1. Piramid
  int piramidHeight = 8;
  piramid(piramidHeight);

  stdout.write('\n');

  //* 1.2. Jam Pasir
  int jamPasirHeight = 11;
  jamPasir(jamPasirHeight);

  stdout.write('\n');

  //* 1.3. Faktorial
  BigInt num1 = BigInt.from(10);
  BigInt num2 = BigInt.from(40);
  BigInt num3 = BigInt.from(50);

  stdout.write("$num1! = ${faktorial(num1)}\n");
  stdout.write("$num2! = ${faktorial(num2)}\n");
  stdout.write("$num3! = ${faktorial(num3)}\n");

  stdout.write('\n');

  //* 2. Function - Luas Lingkaran
  double radius = 9;
  luasLingkaran(radius);
}

//* 1.1. Piramid
void piramid(int height) {
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < height - i - 1; j++) {
      stdout.write("  ");
    }

    for (int k = 0; k <= 2 * i; k++) {
      stdout.write("* ");
    }

    stdout.write("\n");
  }
}

//* 1.2. Jam Pasir
void jamPasir(int height) {
  int rows = height ~/ 2;

  // segitiga bagian atas
  for (int i = 0; i < rows; i++) {
    for (int l = 0; l < i; l++) {
      stdout.write(" ");
    }

    for (int m = 2 * rows; m >= 2 * i; m--) {
      stdout.write("0");
    }

    stdout.write('\n');
  }

  // segitiga bagian bawah
  for (int i = 0; i < rows + 1; i++) {
    for (int j = 0; j < rows - i; j++) {
      stdout.write(" ");
    }

    for (int k = 0; k <= 2 * i; k++) {
      stdout.write("0");
    }

    stdout.write("\n");
  }
}

//* 1.3. Faktorial
// BigInt untuk meng-handle hasil return nilai di atas 2^63
BigInt faktorial(BigInt num) {
  return num <= BigInt.zero ? BigInt.one : num * faktorial(num - BigInt.one);
}

//* 2. Function - Luas Lingkaran
final double PI = 3.14;
void luasLingkaran(double radius) {
  stdout.write(
      "Luas Lingkaran dengan Jari-Jari $radius = ${PI * radius * radius}");
}
