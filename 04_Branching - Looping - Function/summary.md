# Summary of Branching, Looping, Function

### Branching

- Pengambilan Keputusan: menentukan alur program berdasarkan kondisi
  - **if**(bool) {dijalankan jika bool true}
  - **if**(bool) {dijalankan jika bool true}  
    **else** {dijalankan jika bool false}
  - **if**(bool-1) {dijalankan jika bool-1 true}  
    **else if**(bool-n) {dijalankan jika bool-n true}
  - ternary: (bool) ? {jika true} : {jika false} -> bisa nested

### Looping

- Menjalankan proses secara berulang

  - **for**(nilai_awal, bool, pengubah_nilai_awal) {dijalankan jika bool true}  
    Total perulangan diketahui
  - **for**(var element in iterable) {iterasi setiap element di iterable}
  - **while**(bool) {dijalankan jika bool true}  
    Total perulangan tidak diketahui
  - **do**{dijalankan jika bool true, minimal sekali} **while**(bool);
  - **switch** (expression) { **case** (bool): {jika true; break;} default: {jika false}}

- Menghentikan perulangan
  - **break**: menghentikan seluruh perulangan
  - **continue**: menghentikan iterasi saat ini, lanjut ke iterasi berikutnya

### Function

- Kode (perintah) yang dapat digunakan berulang kali
  - < tipe data > < nama fungsi >(< tipe_data parameter >) {perintah fungsi < return nilai >}
    - Parameter bersifat opsional
    - Tipe data return harus sama dengan tipe data fungsi
- Pemanggilan
  - < nama fungsi >(< parameter >);
- Perbedaan
  - Function: di luar class
  - Method: di dalam class
