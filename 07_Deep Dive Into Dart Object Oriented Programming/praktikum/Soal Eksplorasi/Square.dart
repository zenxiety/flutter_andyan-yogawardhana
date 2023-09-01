import 'Shape.dart'; // import interface class Shape dari file terpisah

// struktur class Square yang mengimplementasi class Shape
class Square implements Shape {
  // private property baru yang dimiliki class Square
  late final int _side;

  // constructor class Rectangle yang melakukan assign ke property Square
  Square({required int side}) : _side = side;

  // proses override method getArea yang dimiliki parent class Shape menjadi fungsi luas persegi
  @override
  int getArea() {
    return _side * _side;
  }

  // proses override method getPerimeter yang dimiliki parent class Shape menjadi fungsi keliling persegi
  @override
  int getPerimeter() {
    return 4 * _side;
  }

  // getter untuk private property class Square
  int get side => _side;
}
