import 'dart:io';

void main() async {
  //* 3. Faktorial Asinkronus
  // input angka yang akan dicari nilai faktorialnya
  int num = int.parse(stdin.readLineSync()!);

  // menghitung faktorial angka secara asinkronus dan menyimpan ke variabel
  int result = await faktorial(num);

  stdout.write("\n$result");
}

// 3. fungsi perhitungan bilangan faktorial secara asinkronus
Future<int> faktorial(int num) async {
  return await Future.delayed(Duration(seconds: 1), () async {
    stdout.write("$num ");
    if (num == 1)
      return 1; // base case
    else
      return num * await faktorial(num - 1); // fungsi rekursif
  });
}
