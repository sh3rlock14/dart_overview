/// Initializer list + private instance variables + static class members

class MyColor {
  int _red;
  int _green;
  int _blue;


  // Create "Black" named Constructor
  MyColor.black()
  : _red = 0,
    _green = 0,
    _blue = 0;

  // Create "White" named Constructor
  MyColor.white()
      : _red = 255,
        _green = 255,
        _blue = 255;


  MyColor([int red=0, int green=0, int blue=0])
      : assert(isValidColor(red) && isValidColor(green) && isValidColor(blue)), // to access an instance member, it has to be static
        _red = red,
        _green = green,
        _blue = blue;
  // By using the Initializer list, I must not declare the color components (int) nullable

  get red => _red;
  get green => _green;
  get blue => _blue;

  get colors => [red,green,blue];

  @override
  String toString() => "r:$red g:$green b:$blue";

  static bool isValidColor(int value) => (0 <= value) && (value <= 255);
}


/// Initializer list

class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  // Create a constructor with an initializer list here:
  FirstTwoLetters(String word)
      : assert(word.length >=2),
        letterOne = word.substring(0,1),
        letterTwo = word.substring(1,2);

}


/// Named Constructor
class Point {
  double x,y;

  Point(this.x, this.y);

  // To use a Named Constructor, invoke it using its full name
  Point.origin()
  : x = 0,
    y = 0;

  @override
  String toString() => "Point: ($x;$y)";

}


/// Factory Constructors
// Dart supports factory constructors, which can return subtypes or even null. To create a factory constructor, use the factory keyword

class Square extends Shape {}
class Circle extends Shape {}

class Shape {
  Shape();

  factory Shape.fromTypeName(String typeName) {

    switch (typeName.toLowerCase()) {
      case "circle": return Circle();
      case "square": return Square();
    }
    print("I don\'t recognize ${typeName}");
    throw Error();
  }
}


class IntegerHolder {
  IntegerHolder();

  // Implement this factory constructor.
  factory IntegerHolder.fromList(List<int> list) {
    int listLen = list.length;
    switch (listLen) {
      case 1 : return IntegerSingle(list[0]);
      case 2 : return IntegerDouble(list[0],list[1]) ;
      case 3 : return IntegerTriple(list[0],list[1],list[2]);
    }
    throw Error();
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;
  IntegerSingle(this.a);
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;
  IntegerDouble(this.a, this.b);
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;
  IntegerTriple(this.a, this.b, this.c);
}

/// Redirecting constructors
// Sometimes a constructor’s only purpose is to redirect to another constructor in the same class.
// A redirecting constructor’s body is empty, with the constructor call appearing after a colon (:)

class Automobile {
  String make;
  String model;
  int _mpg;


  @override
  String toString() => "Make: $make\nModel: $model\nmpg: $mpg";

  // The main constructor for the class
  Automobile(this.make, this.model, [mpg=10])
      : assert(mpg>=0),
        _mpg = mpg;

  // Delegates to the main constructor
  Automobile.hybrid(String make, String model) : this(make, model, 60);

  // Delegates to a named constructor
  Automobile.fancyHybrid() : this.hybrid("FutureCar", "Mark II");


  int get mpg => _mpg;
  set mpg(int value) => this._mpg = value;
}


/// Const Constructors
// If your class produces objects that never change, you can make these objects compile-time constants.
// To do this, define a const constructor and make sure that all instance variables are final.

class ImmutablePoint {
  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);

  static const ImmutablePoint origin = ImmutablePoint(0, 0);
}


class Recipe {
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;

  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium );
}
