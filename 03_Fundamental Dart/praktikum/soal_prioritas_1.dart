void main() {
  //* 1. Persegi dan Persegi Panjang
  print('Keliling Persegi = ${kelilingPersegi(4.4)}');
  print('Luas Persegi = ${luasPersegi(4.4)}');
  print('Keliling Persegi Panjang = ${kelilingPersegiPanjang(4.4, 2)}');
  print('Luas Persegi Panjang = ${luasPersegiPanjang(4.4, 2)}');

  //* 2. Lingkaran
  print('Keliling Lingkaran = ${kelilingLingkaran(4.4)}');
  print('Luas Lingkaran = ${luasLingkaran(4.4)}');
}

// 1. Persegi dan Persegi Panjang
// 1. Rumus keliling persegi
double kelilingPersegi(double sisi) {
  return 4 * sisi;
}

// 1. Rumus luas persegi
double luasPersegi(double sisi) {
  return sisi * sisi;
}

// 1. Rumus keliling persegi panjang
double kelilingPersegiPanjang(double panjang, double lebar) {
  return 2 * (panjang + lebar);
}

// 1. Rumus luas persegi panjang
double luasPersegiPanjang(double panjang, double lebar) {
  return panjang * lebar;
}

// 2. Lingkaran
final double PI = 3.14;

// 2. Rumus keliling lingkaran
double kelilingLingkaran(double radius) {
  return 2 * PI * radius;
}

// 2. Rumus luas lingkaran
double luasLingkaran(double radius) {
  return PI * radius * radius;
}
