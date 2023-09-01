import 'Balok.dart'; // import class Balok dari file terpisah
import 'Kubus.dart'; // import class Kubus dari file terpisah

void main() {
  // inisiasi object dari class Balok yang baru dengan parameter constructor Balok
  final Balok b1 = Balok(p: 2, l: 3, t: 4);
  // menampilkan nilai volume dengan method dari abstract class BangunRuang yang telah ter-override dengan method yang ada di class Balok turunannya
  print(
      "Volume balok dengan panjang ${b1.panjang}, lebar ${b1.lebar}, dan tinggi ${b1.tinggi} = ${b1.volume()}");

  // inisiasi object dari class Kubus yang baru dengan parameter constructor Kubus
  final Kubus k1 = Kubus(sisi: 4);
  // menampilkan nilai volume dengan method dari abstract class BangunRuang yang telah ter-override dengan method yang ada di class Kubus turunannya
  print("Volume kubus dengan sisi ${k1.sisi} = ${k1.volume()}");
}
