import 'Shape.dart'; // import interface class Shape dari file terpisah

// struktur class Rectangle yang mengimplementasi class Shape
class Rectangle implements Shape {
  // private property baru yang dimiliki class Rectangle
  late final int _width;
  late final int _height;

  // constructor class Rectangle yang melakukan assign ke property Rectangle
  Rectangle({required int width, required int height})
      : _width = width,
        _height = height;

  // proses override method getArea yang dimiliki parent class Shape menjadi fungsi luas persegi panjang
  @override
  int getArea() {
    return _width * _height;
  }

  // proses override method getPerimeter yang dimiliki parent class Shape menjadi fungsi keliling persegi panjang
  @override
  int getPerimeter() {
    return 2 * (_width + _height);
  }

  // getter untuk private property class Rectangle
  int get width => _width;
  int get height => _height;
}
