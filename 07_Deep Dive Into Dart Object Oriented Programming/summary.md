# Summary of Deep Dive Into Dart OOP

### Constructor

- Dijalankan saat pembuatan object
- Penulisan di dalam class
  > `NamaClass({required this.prop1, this.prop2 = defaultVal})`
  - Untuk mengolah data sebaiknya di method
- Penulisan untuk inherited class
  > `Class() { super.parentProp = val; }`

### Inheritance

- Class baru dari class yang sudah ada
- Sifat turunan dari parent
- Melakukan inheritance
  > `class Class extends Parent {`  
  > `Class() { parentProp1 = val1; parentProp2 = val2 }`  
  > `}`
- **@override** untuk menggunakan dan mengubah method superclass
  > `@override`  
  > `T parentFunction() { modifiedProcess; }`
  - Method sama proses berbeda
- Keyword **this** untuk akses property internal kelas tersebut, refer ke kelas itu sendiri
- Keyword **this.super** untuk akses property parent

- Superclass biasanya isinya function kosong untuk implement penamaan
- Interface

  - Semua method harus di-override
    - Child class
      > `class Class implements Parent { @override semua_method() { proses baru } }`
    - Superclass
      > `interface class Parent {}`

- Abstract

  - Tidak semua method harus di-override
  - Tidak dapat dibuat object
    - Child class
      > `class Class extends Parent { @override semua_method() { proses baru } }`
    - Superclass
      > `abstract class Parent {}`

- With

  - Tidak wajib semua override
  - Jika extends hanya bisa dipakai sekali, with bisa berkali kali
    > `class Class with Super1, Super2, Super3 {}`

- Polymorphism

  - Data mampu berubah menjadi bentuk lain menggunakan super class
    > `Parent object = Class();`

- Generics

  - Mampu menerima tipe data berbeda
    - Class
      > `class Class<T> { Class(T i) {val = i} }`
    - Object
      > `var object = Class<String>('mobil');`

### Enkapsulasi

- Menyembunyikan data untuk meningkatkan integritas, mengurangi kompleksitas dan bug

  - Variabel privat: **\_variabel** -> akses hanya dalam satu kelas/method

- Getter & Setter
  - Mengakses variabel privat
    - Getter: **`T get variable => _variable`**
    - Setter: **`set variable(T newVar) {_variable = newVar};`**
