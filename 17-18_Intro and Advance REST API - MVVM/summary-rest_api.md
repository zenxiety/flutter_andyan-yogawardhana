# Summary of Intro & Advance REST API

## REST API

- Representational State Transfer - Application Programming Interface
- arsitektural pemisah UI dan logic yang berkirim data melalui HTTP Request
- jembatan client dengan server; interaksi ke database
- memanggil URL dan mendapatkan response
- methods:
  - GET : ambil data dan menampilkan : Read
  - POST : ada yang dikirimkan ke server : Create
  - PUT : sama seperti post; fokus ke update : Update
  - DELETE : mengirim parameter dan menghapus data : Delete
- hit API -> akses server -> return data
- API contract : perjanjian API FE dan BE

## HTTP

- protokol/jembatan pengiriman data internet
- pola: request client -> diolah server -> response server
- struktur
  - request
    - URL : alamat halaman
    - Method : GET, POST, PUT, DELETE : aksi
    - Header : informasi tambahan request yang dikirim
      - contoh : private API butuh token
    - Body : data request; parameter yang dikirim
  - response
    - Status Code : kode response (sukses/gagal)
    - Header : informasi tambahan response yang diberikan
    - Body : data response yang diterima
- akses WebView wajib HTTPS

## Dio

- [Dart package](https://pub.dev/packages/dio) untuk HTTP client dan REST API
- penggunaan: `Dio().get('URL').then((response) { print(response); })`
- wajib pakai `try catch` jika ada interaksi dengan API; di services dan provider
- flow MVVM : services -> provider -> screens
- cari tau bentuk response -> [json to dart](app.quicktype.io) -> cari tau key request -> return sebagai class model
- ENUM : class yang diisi dengan property :
  - `enum State { initial, loading, loaded, failed }`
  - error di catch harus diproses dengan baik di UI; ganti state sesuai proses
  - Provider `addlistener` : UI untuk state (loaded & failed), redirect
- `on DioException catch` : hanya menangkap error dari Dio

## JSON Serialization

- Javascript Object Notation : cara penulisan data REST API
- format data yang diterima dari API
- Flutter menerima data map; ada possible typo -> solusi: pakai model class
- Serialisasi / Deserialisasi : map/list -> JSON dan sebaliknya
  - `jsonEncode` / `jsonEncode` dari `dart:convert`
