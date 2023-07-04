/// Dart OptionalParameters
// Dart has two kinds of function parameters: positional and named

/// Positional
int sumUp(int a, int b, int c) {
  return a + b + c;
}

/// Optional positional parameters
// With Dart, you can make these positional parameters optional by wrapping them in [] brackets:
// Optional positional parameters are always last in a function’s parameter list.
// Their default value is null unless you provide another default value:
int sumUpToFive(int a, [int? b, int? c, int? d, int? e=100]) {
  int sum = a;
  if (b != null) sum += b;
  if (c != null) sum += c;
  if (d != null) sum += d;
  if (e != null) sum += e;
  return sum;
}


/// Optional named parameters
// Using a curly brace {} syntax, you can define optional parameters that have names.
int sumUpNamed({int a=0, int? b, int c=0}) { //define a default value
  return a + b! + c; //call a  check on null
}

class MyDataObject {
  final int? anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt, // if we let this be null, then we must define anInt as nullable
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  // Add your copyWith method here:
  // Take three named, nullable parameters: newInt,newString,newDouble
  // returns a new MyDataObject based on the current instance, with data from the preceding parameters (if any) copied into the object’s properties.
  // For example, if newInt is non-null, then copy its value into anInt.
  MyDataObject copyWith({int? newInt, String? newString, double? newDouble}) {
    return MyDataObject(anInt: newInt ?? this.anInt, aString: newString ?? this.aString, aDouble: newDouble ?? this.aDouble);
  }
}


main() {
  print("SumUp(1, 2, -3): ${sumUp(1, 2, -3)}");
  print("SumUpToFive(1, 2, 6): ${sumUpToFive(1, 2, 6)}"); // e has default val = 100
  print("SumUpNamed(a:1, b:2, c:3): ${sumUpNamed(a:1, b:2, c:3)}");
  print("SumUpNamed(b:2, c:3): ${sumUpNamed(b:2, c:3)}"); //can ignore the ones that have default value; can override the default value

  final source = MyDataObject();
  final errs = <String>[];

  try {
    final copy = source.copyWith(newInt: 12, newString: 'New!', newDouble: 3.0);

    if (copy.anInt != 12) {
      errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), and the new object\'s anInt was ${copy.anInt} rather than the expected value (12).');
    }

    if (copy.aString != 'New!') {
      errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), and the new object\'s aString was ${copy.aString} rather than the expected value (\'New!\').');
    }

    if (copy.aDouble != 3) {
      errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), and the new object\'s aDouble was ${copy.aDouble} rather than the expected value (3).');
    }
  } catch (e) {
    print('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0) and got an exception: ${e.runtimeType}');
  }

  try {
    final copy = source.copyWith();

    if (copy.anInt != 1) {
      errs.add('Called copyWith(), and the new object\'s anInt was ${copy.anInt} rather than the expected value (1).');
    }

    if (copy.aString != 'Old!') {
      errs.add('Called copyWith(), and the new object\'s aString was ${copy.aString} rather than the expected value (\'Old!\').');
    }

    if (copy.aDouble != 2) {
      errs.add('Called copyWith(), and the new object\'s aDouble was ${copy.aDouble} rather than the expected value (2).');
    }
  } catch (e) {
    print('Called copyWith() and got an exception: ${e.runtimeType}');
  }

  if (errs.isEmpty) {
    print("All tests passed");
  } else {
    print(errs);
  }



}