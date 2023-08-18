# Summary of Fundamental Dart

### Dart Programming Language

- Dart: Bahasa pemrograman untuk membuat aplikasi frontend agar berjalan cepat.
  Flutter -> framework
  Mobile != tablet (tidak responsif)

### Nilai Plus Dart

- Type-safe
- Null-safety: tidak bisa diisi null kecuali memiliki tipe data nullable (<tipe data>?)
- Rich standart library
- Multiplatform

### Dasar Pemrograman Dart

- Fungsi main: pertama dijalankan
- Fungsi, perintah, dan fitur lain:
  - print: menampilkan data ke layar
  - komentar: baris kode yang tidak dijalankan -> // atau /\* \*/ (multiline) atau /// (keterangan variabel/function di line selanjutnya saat hover)
  - variabel: menyimpan data, rekomendasi pakai camelcase -> <tipe data> <nama> = <nilai>
  - konstanta: menyimpan data dengan nilai tetap -> final <nama> = <nilai> (runtime constant) atau const (compiletime constant)
  - tipe data: jenis data yang dapat dikelola
    primitive -> int, double, bool, string
    - var: inisiasi tipe data sesuai nilai pertama assignment
    - dynamic: tipe data fleksibel
    - BigInt: int dengan value besar
  - operator: operasi pengolahan data
    - arithmetic: perhitungan matematis -> +, -, \*, /, %
    - assignment: memberi nilai variabel -> =, <arithmetic>=
    - comparison: perbandingan nilai -> ==, <, <=, >, >=
    - logical: gabungan kondisi -> &&, ||, !
