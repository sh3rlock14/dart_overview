import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;

  Rectangle({this.width = 0, this.height = 0, this.origin = const Point(0, 0)}); // Point is a Dart Math class

  @override
  String toString() => "Origin: (${origin.x}, ${origin.y}), width: $width, height: $height";

}