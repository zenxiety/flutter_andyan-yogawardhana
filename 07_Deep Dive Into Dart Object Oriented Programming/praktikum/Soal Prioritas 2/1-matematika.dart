import 'FaktorPersekutuanTerbesar.dart'; // import class FPB dari file terpisah
import 'KelipatanPersekutuanTerkecil.dart'; // import class KPK dari file terpisah

void main() {
  // inisiasi object dari class KPK yang baru
  final KelipatanPersekutuanTerkecil kpk1 =
      KelipatanPersekutuanTerkecil(x: 24, y: 36);
  // print method KPK yang telah di-override
  print("KPK dari ${kpk1.x} dan ${kpk1.y} adalah ${kpk1.hasil()}");

  // inisiasi object dari class FPB yang baru
  final FaktorPersekutuanTerbesar fpb1 =
      FaktorPersekutuanTerbesar(x: 24, y: 36);
  // print method FPB yang telah di-override
  print("KPK dari ${fpb1.x} dan ${fpb1.y} adalah ${fpb1.hasil()}");
}
