# Summary of Introduction Flutter Widget

### Flutter (Framework)

- Development tools pembuatan aplikasi
- Keunggulan relatif: kemudahan, produktivitas, dokumentatsi, komunitas
- Bagian: SDK & Framework
- Project

  - Inisiasi: `flutter create (nama_project)`
  - Run: `flutter run`
  - Direktori project: lib & test
    - File utama (entry point): lib/main.dart

- Installation: lolos system requirements, install SDK, Android Studio, Android Toolchain

### Widget

- Class pembentuk UI

- Stateless Widget

  - Tidak ada perubahan data, fokus ke tampilan

- Stateful Widget

  - Mementingkan perubahan data
  - Menggunakan class state
  - Contoh: tambah counter pas onPressed, panggil functionnya, update di UI pake `setState((){ perubahan; })`

- Built-in Widget

  - Bawaan flutter, bisa langsung digunakan
  - Contoh:
    - MaterialApp: membangun aplikasi dengan desain material
    - Scaffold: membentuk halaman
    - AppBar: application bar di atas halaman
    - Text: teks

- Const: value yang langsung diassign dan ga bakal berubah pas build

### Demo & Implementation

- Design system

  - Android: MaterialApp
  - iOS: Cupertino

- MaterialApp

  - home: tampilan aplikasi
  - appBar: header
  - body: main
  - bottom navbar: footer
  - Layout:
    - column: vertikal
    - row: horizontal
    - center: tengah

- Scaffold: struktur rangka implement posisi widget di halaman

- Best practice: satu halaman satu class satu file setiap Scaffold

- Error dilihat di problems/debug console; Ada message, file, dan line errornya

##### Catatan Tambahan

- Penugasan:
  - `flutter clean` sebelum add commit
    - restore: `flutter pub get`, download icon, pubspec.yaml
  - screenshot dalam bentuk gif
