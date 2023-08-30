import 'Buku.dart'; // import class Buku dari file terpisah

// struktur class TokoBuku
class TokoBuku {
  final List<Buku> _daftarBuku = []; // daftar buku yang tersedia di toko buku
  final String _name; // nama toko buku

  // constructor untuk class TokoBuku saat menambahkan toko buku baru
  TokoBuku(this._name);

  // method untuk menambahkan data buku baru ke toko buku
  void addBuku(Buku buku) {
    _daftarBuku.add(buku);
  }

  // method untuk menghapus data suatu buku dari toko buku
  List<Buku> removeBuku(Buku removedBuku) {
    _daftarBuku.removeWhere((buku) => buku == removedBuku);
    return _daftarBuku;
  }

  // method untuk mendapatkan semua data buku yang tersedia di toko buku
  void listBuku() {
    print("Daftar buku yang tersedia di ${_name}: ");
    for (Buku buku in _daftarBuku) {
      print(
          "${buku.id} | ${buku.judul} | ${buku.penerbit} | ${buku.harga} | ${buku.kategori}");
    }
  }

  // getter untuk mendapatkan property list buku yang tersedia
  List<Buku> get daftarBuku => _daftarBuku;
}
