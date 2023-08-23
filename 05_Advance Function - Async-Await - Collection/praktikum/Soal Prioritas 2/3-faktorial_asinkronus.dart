import 'dart:io';

void main() async {
  //* 3. Faktorial Asinkron
  int num = int.parse(stdin.readLineSync()!);

  stdout.write(await faktorial(num));
}

// 3. fungsi perhitungan bilangan faktorial
Future<int> faktorial(int num) async {
  if (num == 1)
    return 1;
  else
    return num * await faktorial(num - 1);
}
