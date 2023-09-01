import 'Circle.dart'; // import class Circle dari file terpisah
import 'Rectangle.dart'; // import class Rectangle dari file terpisah
import 'Square.dart'; // import class Square dari file terpisah

void main() {
  // inisiasi object Circle baru dengan parameter tertentu
  final Circle c1 = Circle(radius: 4);
  // menampilkan nilai luas dan keliling lingkaran c1
  print("Luas lingkaran dengan radius ${c1.radius} = ${c1.getArea()}");
  print("Keliling lingkaran dengan radius ${c1.radius} = ${c1.getPerimeter()}");

  // inisiasi object Square baru dengan parameter tertentu
  final Square s1 = Square(side: 4);
  // menampilkan nilai luas dan keliling persegi s1
  print("Luas persegi dengan panjang sisi ${s1.side} = ${s1.getArea()}");
  print(
      "Keliling persegi dengan panjang sisi ${s1.side} = ${s1.getPerimeter()}");

  // inisiasi object Rectangle baru dengan parameter tertentu
  final Rectangle r1 = Rectangle(width: 2, height: 4);
  // menampilkan nilai luas dan keliling persegi panjang r1
  print(
      "Luas persegi panjang dengan tinggi ${r1.height} dan lebar ${r1.width} = ${r1.getArea()}");
  print(
      "Keliling persegi panjang dengan tinggi ${r1.height} dan lebar ${r1.width} = ${r1.getPerimeter()}");
}
