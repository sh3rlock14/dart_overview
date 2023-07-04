import 'dart:math';

/// Make use of Factory design pattern: it has several advantages over direct object instantiation:
/// - hides details of instantiations
/// - provide the ability to return a subtype of the factory's return type
/// - optionally returns an existing object rather than a new one

abstract class Shape {
  factory Shape(String type, {num bc = 1}) {
    switch (type.toLowerCase()) {
      case "circle": return Circle(radius: bc);
      case "square": return Square(side:bc);
    }
    throw "Can\'t create Shape!";
  }

  num get area;
}

class Circle implements Shape {
  late num _radius;
  Circle({num radius=0}) {
    this._radius = radius;
  }

  num get area => pi * pow(radius,2); // use the getter

  /// Getter and Setter can share the same name
  /// Getter usage:
  ///   var = obj.getter
  /// Setter usage:
  ///   obj.setter = newValue
  num get radius => _radius;
  set radius(num value) => this._radius = value;

}

/// Dart does not include the keyword "interface" because every class defines an interface
/// Class A implementing another class B does inherit B's interface, but not its implementation
class CircleMock implements Circle {
  num area = 0;
  num _radius = 0;

  num get radius => _radius;
  set radius(num value) => this._radius = value;
}


class Square implements Shape {
  final num side;
  Square({this.side = 0});
  num get area => pow(side,2);
}


/// Implement a factory as a top-level function by adding the following function
/// at the highest level (outside any class)

Shape shapeFactory(String type, {num bc=2}) {
  switch (type.toLowerCase()) {
    case "circle": return Circle(radius: bc);
    case "square": return Square(side:bc);
  }
  throw "Can\'t create Shape!";
}