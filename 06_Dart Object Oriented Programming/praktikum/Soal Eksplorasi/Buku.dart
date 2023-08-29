// struktur class Buku
class Buku {
  // data/property buku
  String _id;
  String _judul;
  String _penerbit;
  int _harga;
  String _kategori;

  // constructor saat menambahkan buku baru
  Buku(this._id, this._judul, this._penerbit, this._harga, this._kategori) {}

  // setter dan getter property id buku
  set id(String id) => _id = id;
  String get id => _id;

  // setter dan getter property judul buku
  set judul(String judul) => _judul = judul;
  String get judul => _judul;

  // setter dan getter property penerbit buku
  set penerbit(String penerbit) => _penerbit = penerbit;
  String get penerbit => _penerbit;

  // setter dan getter property harga buku
  set harga(int harga) => _harga = harga;
  int get harga => _harga;

  // setter dan getter property kategori buku
  set kategori(String kategori) => _kategori = kategori;
  String get kategori => _kategori;
}
