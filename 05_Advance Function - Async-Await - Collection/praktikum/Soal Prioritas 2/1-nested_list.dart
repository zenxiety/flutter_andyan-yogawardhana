import 'dart:io';

void main() async {
  //* 2.1. Nested List
  List<List<int>> list = [];

  // menambahkan elemen berupa list ke list awal dengan fungsi verifikasi
  addToListOfList(list, [1, 2]);
  addToListOfList(list, [2, 4]);
  addToListOfList(list, [3, 6, 9]);
  addToListOfList(list, [10]);
  addToListOfList(list, [20, 40]);

  // inisiasi map berdasarkan list
  Map<String, List<int>> map = <String, List<int>>{};
  int key = 0; // variabel sebagai key untuk map yang akan dibuat

  for (List<int> el in list) {
    // input list ke map dengan key string "list-{key}" dan value list of integer dari elemen list awal
    map['list-${key++}'] = el;
  }

  stdout.write("\nCreated map: $map\n");
}

// 1. fungsi untuk memastikan setiap elemen yang dimasukkan berupa list dengan 2 elemen data
List<List<int>> addToListOfList(List<List<int>> list, List<int> el) {
  // tiap elemen wajib memiliki 2 data sub-elemen
  if (el.length == 2) {
    stdout.write('Element $el added to the list.\n');
    list.add(el);
  } else {
    stdout.write('Invalid element $el. The list should have a length of 2.\n');
  }

  return list;
}
