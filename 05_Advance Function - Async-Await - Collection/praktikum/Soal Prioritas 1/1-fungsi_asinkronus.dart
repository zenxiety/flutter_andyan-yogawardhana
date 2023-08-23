void main() async {
  //* 1. Fungsi Asinkronus
  List<double> data = [10, 25.5, 30, 4.05]; // list data
  int multiplier = 2; // pengali

  // memasukkan list data dan pengali ke parameter fungsi
  print(await multiply(data, multiplier));
}

// 1. fungsi yang menerima 2 parameter untuk mengalikan setiap elemen list dengan nilai tertentu secara asynchronous
Future<List<double>> multiply(List<double> data, int multiplier) async {
  List<double> newData = []; // list baru untuk menampung hasil perkalian

  // perulangan secara asynchronous yang mengalikan elemen list data dengan pengali
  await Future.forEach(data, (element) => newData.add(element * multiplier));

  // return list baru hasil proses perkalian
  return newData;
}
