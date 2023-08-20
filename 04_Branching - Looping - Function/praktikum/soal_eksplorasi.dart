import 'dart:io';

void main() {
  //* 1. Bilangan Prima
  String number1 = stdin.readLineSync()!;
  isPrime(int.parse(number1));
  String number2 = stdin.readLineSync()!;
  isPrime(int.parse(number2));

  //* Tabel Perkalian
  String nxn = stdin.readLineSync()!;
  tabelPerkalian(int.parse(nxn));
}

//* 1. Bilangan Prima
void isPrime(int num) {
  bool isPrime = true;

  for (int i = 2; i < num; i++) {
    // jika ditemukan pembagi selain 1 dan bilangna itu sendiri, maka bilangan tersebut bukan bilangan prima
    if (num % i == 0) {
      isPrime = false;
      break;
    }
  }

  isPrime
      ? stdout.write('bilangan prima\n')
      : stdout.write('bukan bilangan prima\n');
}

//* Tabel Perkalian
void tabelPerkalian(int num) {
  for (int i = 1; i <= num; i++) {
    for (int j = 1; j <= num; j++) {
      int res = i * j;
      stdout.write("$res ");

      // spacing untuk hasil dengan digit terbesar sebanyak 2 digit
      if (num <= 10) {
        if (res <= 9) stdout.write(" ");
      }
      // spacing untuk hasil dengan digit terbesar sebanyak 3 digit
      else {
        if (res <= 9) stdout.write("  ");
        if (res > 9 && res <= 99) stdout.write(" ");
      }
    }

    stdout.write('\n');
  }
}
