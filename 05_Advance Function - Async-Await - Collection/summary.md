# Summary of Advanced Function - Async-Await - Collection

### Advanced Function

- **Anonymous Function**  
  Tidak memiliki nama, fungsi sebagai data
  > () {perintah yang dijalankan}
- **Arrow Function**  
  Nama opsional  
  Nilai return diambil dari data isi fungsi tersebut  
  Jika bisa ditulis di satu baris
  > () => proses_yang_dijalankan();
- **Optional Parameter**
  Parameter fungsi yang bisa kosong

  > (tipe data) (nama function)({(tipe data) (nama optional parameter)}) {}

      - Bisa pakai {} atau []

  - [] -> harus pakai nullable atau tambah default value

- **Default Value**
  > (nama function)({(tipe data) (nama variabel) = (default value)})

### Async-Await

- Menjalankan beberapa proses tanpa menunggu
- Menentukan proses mana yang selesai terlebih dahulu
- Await menunggu async selesai
- Dalam suatu fungsi async, baris kode di bawah await akan menunggu proses await selesai terlebih dahulu sebelum kode tersebut dijalankan

  > function() async { await process_X }

- **Future**  
  Data dapat ditunggu, membawa return fungsi async  
  Menandakan sebuah function bisa di-await  
  Harus menggunakan await jika dipanggil dari function

  > Future< tipe data > (nama fungsi)() {}

- Aplikasi: proses yang butuh waktu => ambil data dari database, internet, user input (biometric)
- Jika return error seperti Instance..., ada fungsi yang perlu ditunggu

- **Stream**: untuk data yang bersifat realtime
- **Exception**: return error dan stop proses selanjutnya

- Function **then**: jika function tidak bisa memakai await
  > await function().then((value) => { function(value) });

### Collection

- **List**  
  Menyimpan data secara berbaris dengan index di setiap elemen

  > List< tipe data > (nama variabel) = []

- **Map**  
  Menyimpan data secara key-value dengan key sebagai index

  > Map< tipe data key, tipe data value > (nama variabel) = {}

- **Set**
  List tanpa duplikat

- Loop untuk mengiterasi elemen collection (list):
  > for (var element in list) {}  
  > list.**forEach**()
  - Perbedaan: cara pemanggilan async function
    > for (var el in list) { await function() }  
    > .foreach((el) async { await function() });
