import 'package:dart_overview/Constructor.dart';

/// Constructor: usage of this
// Dart provides a handy shortcut for assigning values to properties in a constructor: use this.propertyName when declaring the constructor

/// Initializer lists
// Sometimes when you implement a constructor, you need to do some setup before the constructor body executes.
// e.g.: final fields must have values before the constructor body executes

/// Named Constructors
// To allow classes to have multiple constructors, Dart supports named constructors

/// Factory constructor
// Dart supports factory constructors, which can return subtypes or even null. To create a factory constructor, use the factory keyword

main() {

  MyColor mc = MyColor(126,30,30);
  print("Mycolor: ${mc}");

  final errs = <String>[];

  try {
    final result = FirstTwoLetters('My String');

    if (result.letterOne != 'M') {
      errs.add('Called FirstTwoLetters(\'My String\') and got an object with letterOne equal to \'${result.letterOne}\' instead of the expected value (\'M\').');
    }

    if (result.letterTwo != 'y') {
      errs.add('Called FirstTwoLetters(\'My String\') and got an object with letterTwo equal to \'${result.letterTwo}\' instead of the expected value (\'y\').');
    }
  } catch (e) {
    errs.add('Called FirstTwoLetters(\'My String\') and got an exception of type ${e.runtimeType}.');
  }

  bool caughtException = false;

  try {
    FirstTwoLetters('');
  } catch (e) {
    caughtException = true;
  }

  if (!caughtException) {
    errs.add('Called FirstTwoLetters(\'\') and didn\'t get an exception from the failed assertion.');
  }

  if (errs.isEmpty) {
    print("All tests passed!");
  } else {
    print(errs);
  }


  // Use named constructor
  var myPoint = Point(25, 50);
  print(myPoint);
  var origin = Point.origin(); //named constructor
  print(origin);

  var black = MyColor.black();
  var white = MyColor.white();

  print("Black constructor: $black");
  print("White constructor: $white");


  // Use redirecting constructors
  Automobile fancyCar = Automobile.fancyHybrid();
  print(fancyCar);

  Automobile normalCar = Automobile("Audi", "Xi"); // if mpg is not defined, default is: 10
  print(normalCar);


  // Use Const Constructor
  final errs2 = <String>[];

  try {
    const obj = Recipe(['1 egg', 'Pat of butter', 'Pinch salt'], 120, 200);

    if (obj.ingredients.length != 3) {
      errs2.add('Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and got an object with ingredient list of length ${obj.ingredients.length} rather than the expected length (3).');
    }

    if (obj.calories != 120) {
      errs2.add('Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and got an object with a calorie value of ${obj.calories} rather than the expected value (120).');
    }

    if (obj.milligramsOfSodium != 200) {
      errs2.add('Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and got an object with a milligramsOfSodium value of ${obj.milligramsOfSodium} rather than the expected value (200).');
    }
  } catch (e) {
    print('Tried calling Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and received a null.');
  }

  if (errs.isEmpty) {
    print("All tests passed");
  } else {
    print(errs2);
  }


}