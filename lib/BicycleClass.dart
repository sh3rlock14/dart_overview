class Bicycle {
  int cadence;  // all identifiers are public bu default
  int _speed = 0; // _ makes a variable Library "private"; non-nullable var must be initialized
  /// Library privacy generally means that the identifier is visible only inside the file (not just the class)
  int gear;
  String? brand = "Shimano";

  /// Dart does not support overloading
  Bicycle(this.cadence, this.gear); // No-body Constructor; direct initialization

  @override
  String toString() => "Bicycle: $_speed mph"; // ${expression} or $identifier


  /// Don't need to define your own getters or setters unless you want to enforce read-only or write-only variables
  int get speed => _speed; // getter method in dart; get is a keyword

  void applyBrake(int decrement) => _speed -= decrement;
  void speedUp(int increment) => _speed += increment;
}


