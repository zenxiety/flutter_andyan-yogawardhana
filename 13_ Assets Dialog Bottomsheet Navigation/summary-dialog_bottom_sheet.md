# Summary of Dialog Bottom Sheet

## AlertDialog

- material design (android)
- informasi & mendapat input user
- helper method `showDialog` di `onPressed`
  > `showDialog(context: context, builder: (context) => AlertDialog())`
- properti
  - `content` : text, gambar, animasi
  - `actions` : button respon user

## Bottom Sheet

- dialog yang muncul dari bawah layar
- fungsi `showModalBottomSheet` di `onpressed`
  > `showModalBottomSheet(context: context, builder: (context) => Container())`
- properti : context & builder

## Task Management App

- tambah dan hapus kegiatan
- steps:
  1. membuat **model** informasi yang disimpan di folder models
  2. membuat task screen di folder screens
  3. membuat empty screen di folder screens
  4. membuat `TaskManager` di folder models dengan package **provider**. menambah method `deleteTask` dan `addTask`
  5. menambah `TaskManager` sebagai provider dengan `MultiProvider()` di main.dart
  6. (task screen) fungsi `buildTaskScreen` dengan builder body conditional isi `taskModels`
     > `return Consumer<TaskManager>(builder: (context, manager, child) { condition })`
