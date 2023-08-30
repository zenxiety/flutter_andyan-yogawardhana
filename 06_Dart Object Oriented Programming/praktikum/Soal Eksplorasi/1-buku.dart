import 'Buku.dart'; // import class Buku dari file terpisah
import 'TokoBuku.dart'; // import class TokoBuku dari file terpisah

void main() {
  // inisiasi object toko buku baru dari class TokoBuku
  final TokoBuku tokoBuku = TokoBuku("Zen Bookstore");

  // inisiasi object buku baru dari class Buku
  Buku b1 = Buku("B101", "Book One", "Isaac Newton", 10000, "Science-Fiction");
  b1.judul = "First Book";
  Buku b2 = Buku("B201", "The Meow", "Meowse", 12000, "Philosophy");
  b2.harga = 14000;

  // menambahkan data buku ke toko buku
  tokoBuku.addBuku(b1);
  tokoBuku.addBuku(b2);

  // menghapus data buku dari toko buku
  tokoBuku.removeBuku(b1);

  // menampilkan semua data buku dari toko buku
  tokoBuku.listBuku();
}
