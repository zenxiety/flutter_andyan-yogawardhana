# Summary of Flutter Form

### Form

- Menerima satu/lebih input data user
- Menggunakan Stateful Widget, state disimpan di `GlobalKey<FormState>`

### Input

- **`TextField`** : satu/lebih input text user; tidak bisa divalidasi
  - Data diambil dengan `TextEditingController({default_value})`
    - untuk menampilkan value ke screen, pakai juga `onChanged` dan `setState`
    - passing value ke halaman lain pakai parameter pakai Navigator
    - `.addListener` : handle change yang one-time show, kalau di onChanged kurang tepat
    - `.clear`
  - `decoration` : `InputDecoration`
    - `.collapsed()` : ilangin garis bawah
  - [Dokumentasi](https://medium.com/flutter-community/a-deep-dive-into-flutter-textfields-f0e676aaab7a)
- **`Radio`** : satu opsi pilihan user
  - Data diambil dengan property `value` radio
  - Default value pakai T.value
  - `RadioListTile` : combo Radio + ListTile
    - `onChanged` harus pakai `setState`
- **`Checkbox`** : satu/lebih opsi pilihan user
  - Data diambil dengan property boolean checkbox
  - `setState` body : `val = !val`, parameter value jadi `_`
  - `CheckboxListTile` : combo Checkbox + ListTile
- **`DropdownButton`** : memberi opsi ke user, hanya dapat memilih satu, hanya tampil saat dipilih

  - Data diambil dengan property value `DropdownMenuItem`
  - **`DropdownButtonFormField`**
    - Punya parameter `validator`
    - `DropdownMenuItem`

- **`TextFormField`** : validasi jauh lebih mudah daripada `TextField`
  - Punya parameter `validator`; wajib ada value yang direturn

### Button

- Menjalankan onPressed saat ditekan
- **`ElevatedButton`** : menampilkan child widget
- **`IconButton`** : hanya menampilkan icon
- **`TextButton`** : tidak ada fill color
- **`OutlinedButton`** : cuma ada border
- **`GestureDetector`** : nambah behavior/gesture ke widget sebesar childnya
- **`InkWell`** : mirip `GestureDetector` tapi punya ripple effect
