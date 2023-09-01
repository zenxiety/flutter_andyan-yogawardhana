import 'Shape.dart'; // import interface class Shape dari file terpisah

// struktur class Circle yang mengimplementasi class Shape
class Circle implements Shape {
  // private property baru yang dimiliki class Circle
  late final int _radius;
  final double PI = 3.14;

  // constructor class Rectangle yang melakukan assign ke property Circle
  Circle({required int radius}) : _radius = radius;

  // proses override method getArea yang dimiliki parent class Shape menjadi fungsi luas lingkaran
  @override
  int getArea() {
    return (PI * _radius * _radius)
        .ceil(); // pembulatan ke atas untuk casting tipe data ke integer
  }

  // proses override method getPerimeter yang dimiliki parent class Shape menjadi fungsi keliling lingkaran
  @override
  int getPerimeter() {
    return (2 * PI * _radius)
        .ceil(); // pembulatan ke atas untuk casting tipe data ke integer berdasarkan soal
  }

  // getter untuk private property class Circle
  int get radius => _radius;
}
