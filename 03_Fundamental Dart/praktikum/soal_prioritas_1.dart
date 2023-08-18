void main() {
  //* 1. Persegi dan Persegi Panjang
  double sisi = 4.4;
  print('Keliling Persegi = ${kelilingPersegi(sisi)}');
  print('Luas Persegi = ${luasPersegi(sisi)}');

  double panjang = 4.4;
  double lebar = 2;
  print('Keliling Persegi Panjang = ${kelilingPersegiPanjang(panjang, lebar)}');
  print('Luas Persegi Panjang = ${luasPersegiPanjang(panjang, lebar)}');

  //* 2. Lingkaran
  double radius = 4.4;
  print('Keliling Lingkaran = ${kelilingLingkaran(radius)}');
  print('Luas Lingkaran = ${luasLingkaran(radius)}');
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
