# Summary of Dart Object Oriented Programming

### Object Oriented Programming (OOP)

- Dapat digunakan di bahasa yang bisa defining class
- Program disusun dalam bentuk abstraksi object dan data diletakkan di abstraksi tersebut

- Keuntungan: troubleshoot dan penggunaan ulang mudah  
  **Don't Repeat Yourself**
- Komponen: class, object, property, method, inheritance, generics, dll

### Class & Object

- Class

  - Abstraksi object dengan:
    - Ciri-ciri: **property**
    - Sifat dan kemampuan: **method**
  - Penulisan
    > `class Nama { property; method; }`
  - Pembuatan di file terpisah, nama file sama dengan nama class

- Object
  - Implementasi/instance of class, diperlakukan seperti data
  - Penulisan
    > `final Class nama = Class();`

### Property & Method

- Property
  - Ciri-ciri, hal yang dimiliki class, seperti variabel
  - Inisiasi di dalam class
    > `T nama = value;`
  - Harus membuat object dulu untuk mengakses property
    > `Object o = Object();`  
    > `o.property;`
- Method
  - Sifat, cara/kata kerja, aktivitas untuk melakukan sesuatu
  - Sama seperti function tapi di dalam class
  - Best practice: tidak dibuat di luar class apapun
