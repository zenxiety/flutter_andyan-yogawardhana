# Summary of Platform Widget

### Platform Widget

- Flutter support kedua platform mobile, Android dan iOS
- Memanfaatkan widget dengan gaya berbeda antara platform Android dan iOS
- Bisa pakai CupertinoApp di MaterialApp, tapi tidak sebaliknya

### MaterialApp

- Mengemas seluruh widget aplikasi Android
- Import: `package:flutter/material.dart`
- Struktur MaterialApp

1. **theme** : mengatur tema aplikasi, apply warna ke semua komponen
2. **home** : widget pertama dibuka (halaman utama)
3. **route** : mengatur halaman

- **initialRoute** : route utama, pengganti home
- **routes** : mendaftarkan halaman

  > `routes: { 'halaman' : (_) => const Halaman(), }`

- **Scaffold** : pembangun utama halaman MaterialApp; satu MaterialApp banyak Scaffold; setiap halaman punya Scaffold
- Struktur Scaffold

1. **appBar** : bar menu atas, apply warna dinamis background navbar
2. **drawer** : menu samping
3. **body** : bagian utama
4. **bottomNavigationBar** : menu bawah

### CupertinoApp

- Mengemas seluruh widget aplikasi iOS
- Import: `package:flutter/cupertino.dart`
- Struktur CupertinoApp

  - variabel **\_themeDark** : menyimpan tema pengganti ThemeData.dark() di Material
    > `final _themeDark = const CupertinoThemeData.raw(Brightness.dart, null, null, ...);`

  1. **theme** : mengatur tema aplikasi
  2. **home** : halaman utama

- **CupertinoPageScaffold** : pembangun utama halaman CupertinoApp
- Struktur CupertinoApp
  1. **navigationBar** : bar menu atas
  2. **child** : bagian utama
