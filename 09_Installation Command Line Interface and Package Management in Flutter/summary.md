# Summary of CLI and Package Manager in Flutter

### Flutter CLI

- Interaksi dengan Flutter SDK di Terminal
- Commands:

  - `flutter doctor` : informasi software yang dibutuhkan flutter
  - `flutter create <app_name>` : membuat project flutter app
  - `flutter run <dart_file>` : menjalankan project app di suatu device
  - `flutter emulators` :
    - `flutter emulators`: menampilkan daftar emulator terinstall
    - `flutter emulators --launch <emulator_id>` : membuka emulator
    - `flutter emulators --create [--name xyz]` : membuat emulator baru
  - `flutter channel` : menampilkan daftar flutter channel tersedia dan yang digunakan; better pakai stable
  - `flutter pub` :
    - `flutter pub add <package_name>` : menambahkan packages ke dependencies pubspec.yaml
    - `flutter pub get` : mendownload semua packages/dependencies pubspec.yaml
  - `flutter build` : memproduksi file app untuk deploy/publish ke Store

    - `--debug` : size lebih besar, semua kode digunakan, performa kurang; ketika QA
    - `--release` : size lebih kecil, kode yang tidak dipakai dihapus, performa lebih cepat; ketika udah mau upload ke store
    - `appbundle` : app release lebih optimized untuk PlayStore (Android); extension .aab;
    - hasil build :

  - `flutter clean` : menghapus folder build dan file hasil run aplikasi di emulator, memperkecil project size

### Packages Management

- Sharing packages dengan developer lain di [pub.dev](https://pub.dev)
- Mempercepat app development karena tidak perlu membuat from scratch
- Menambahkan packages:
  - Cari packages di [pub.dev](https://pub.dev), copy dependencies di bagian installing
  - Paste ke pubspec.yaml di bagian dependencies
  - Run `flutter pub`
  - Import package di file Dart
  - Stop/restart app jika dibutuhkan

### Demo & Implementation (Live Session Additional Notes)

- File pubspec.yaml
  - Cek indentasi
  - version: app version di auto increment setiap deploy
    > `(major update).(tambah fitur).(minor changes) => 1.0.0`
  - dependencies: packages yang dipakai di project
  - dev_dependences: packages yang hanya dibutuhkan khusus saat development
    - linter: standar kode rapi
  - assets: list assets(images) yang dipakai di project. kalau banyak pakai nama file
    - ambil image dari internet (link) pakai NetworkImage(), gaperlu di-list dulu
  - fonts: list fonts yang dipakai
  - Setelah modifikasi, harus `flutter pub get` atau autosave `ctrl+s`
- [YouTube Flutter](https://youtube.com/@flutterdev)
  - Packages of the week, rekomendasi packages
  - Compare kode terbaru dengan kode di video 2-3 tahun lalu
- [Google Developer Group](gdg.community.dev)
