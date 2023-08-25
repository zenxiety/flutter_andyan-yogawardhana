import 'dart:io';

void main() async {
  //* 2.1. Nested List
  List<List<String>> list = [];

  // menambahkan elemen berupa list ke list awal dengan fungsi verifikasi
  addToListOfList(list, ["Honda", "NSX"]);
  addToListOfList(list, ["Honda", "GT86"]);
  addToListOfList(list, ["Nissan", "GTR"]);
  addToListOfList(list, ["Nissan", "GTR", "R32"]);
  addToListOfList(list, ["Mazda", "RX7"]);

  stdout.write("\nCreated list: $list\n");
  // inisiasi map berdasarkan list
  Map<String, String> map = <String, String>{};
  for (List<String> el in list) {
    // input list ke map dengan key elemen list pertama dan value elemen list kedua
    map[el[0]] = el[1];
  }

  stdout.write("Created map: $map\n");
}

// 1. fungsi verifikasi untuk memastikan setiap elemen yang dimasukkan berupa list dengan 2 elemen data
List<List<String>> addToListOfList(List<List<String>> list, List<String> el) {
  // tiap elemen wajib memiliki 2 data sub-elemen
  if (el.length == 2) {
    stdout.write('Element $el added to the list.\n');
    list.add(el);
  } else {
    stdout.write('Invalid element $el. The list should have a length of 2.\n');
  }

  return list;
}
