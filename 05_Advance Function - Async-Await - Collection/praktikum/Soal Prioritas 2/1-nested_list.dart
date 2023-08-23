import 'dart:io';

void main() async {
  //* 1. Nested List
  List<List<int>> list = [];

  // menambahkan elemen pada list
  addToListOfList(list, [1, 2]);
  addToListOfList(list, [2, 4]);
  addToListOfList(list, [3, 6, 9]);
  addToListOfList(list, [10]);
  addToListOfList(list, [20, 40]);

  // map pada list untuk menampilkan elemen dan sub-elemen
  for (List<int> listEl in list) {
    stdout.write("Elemen: $listEl\n");
    for (int el in listEl) {
      stdout.write("Sub-elemen: $el\n");
    }
  }

  stdout.write("\n");
}

// 1. fungsi untuk memastikan setiap elemen yang dimasukkan berupa list dengan 2 elemen data
List<List<int>> addToListOfList(List<List<int>> list, List<int> el) {
  // tiap elemen wajib memiliki 2 data sub-elemen
  if (el.length == 2) {
    list.add(el);
  } else {
    stdout.write('Invalid element $el should have the array length of 2\n');
  }

  return list;
}
