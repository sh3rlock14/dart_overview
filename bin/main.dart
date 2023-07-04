import 'dart:math';
import 'package:dart_overview/BicycleClass.dart';
import 'package:dart_overview/Rectangle.dart';
import 'package:dart_overview/Shapes.dart';

///We recommend not having "main" files inside lib/.
///The bin/ directory is the traditional place to put entry points
void main(List<String> args) { //this method lives at top level
  var bike = new Bicycle(2, 1);
  bike.speedUp(10);
  print(bike);
  bike.applyBrake(5);
  print(bike);

  var rect = new Rectangle();
  var rect2 = new Rectangle(width: 200);
  var rect3 = new Rectangle(width: 100, height: 300);
  var rect4 = new Rectangle(origin: Point(0,10));

  List rects = [rect,rect2,rect3,rect4];

  for (final r in rects) {
    print(r);
  }


  final circle = Circle(radius: 3);
  final circle2 = Circle(radius: 4);
  final circle3 = Circle(radius: 3.14);

  List circles = [circle, circle2, circle3];

  for (final Circle c in circles) {
    print("Area of circle with radius ${c.radius}: " +  c.area.toStringAsFixed(2));
  }

  print("circle's radius: " + circle.radius.toStringAsFixed(2));
  circle.radius = 20; // This is the new usage of the setter method
  print("circle's radius: " + circle.radius.toStringAsFixed(2));

  print("\n");

  final square = Square();
  final square2 = Square(side: 10);
  final square3 = Square(side: 5);

  List squares = [square, square2, square3];

  for (Square s in squares) {
    print("Area of square with side: ${s.side}: " +  s.area.toStringAsFixed(2));

  }

  print("\n");


  //Square factorySquare = shapeFactory("square"); //A value of type 'Shape' can't be assigned to a variable of type 'Square'.
  /// When using factory design pattern, remember to explicitly cast the object we want, otherwise we cannot access to its method
  Square factorySquare = shapeFactory("square", bc: 5) as Square;
  print("Area of factory square: " + factorySquare.area.toStringAsFixed(2));
  print("Radius of factory square: " + factorySquare.side.toStringAsFixed(2));

  Circle factoryCircle = shapeFactory("CIRCLE", bc: 3.14) as Circle;
  print("Area of factory circle: " + factoryCircle.area.toStringAsFixed(2));
  print("Radius of factory circle: " + factoryCircle.radius.toStringAsFixed(2));

  try {
    var factoryTriangle = shapeFactory("Triangle");
  } catch(e) {
    print(e);
  }

  Square factoryShapeSquare = Shape("SQUARE", bc: 2) as Square;

  print("\nThe area of factoryShapeSquare is: ${factoryShapeSquare.area}");

}