/// Dart for Functional Programming
/// - pass functions as arguments
/// - assign a function to a variable
/// - deconstruct a function that takes in input a sequence of inputs into a series of functions that take in input a single component of the sequence
/// - create lambda (nameless) functions

String scream(int length) => "A${'a' * length}h!";

main() {
  final values = [
    1,
    2,
    3,
    4,
    5,
    10
  ]; //List and Iterable classes support many other Iterable features

  /// Imperative Version
  print("Imperative version:");
  for (var v in values) print(scream(v));

  /// Functional version
  print("\nFunctional version:");
  values.map(scream).forEach(print);

  /// More Iterable Features
  print("\nWith Iterable features:");
  values.skip(1).take(3).map(scream).forEach(
      print); //skips the first value; gets the next 3 values (the others are skipped)

  num initialValue = 0;
  num iterSum = values.fold(
      initialValue,
      (num prev, num element) =>
          prev +
          element); //Reduces a collection to a single value by iteratively combining each element of the collection with an existing value
  print("\nItersum on values: $iterSum");

  /// Bewareof argument_type_not_assignable Error:
  List aListnum = <num>[10, 2, 3, 4, 5];

  //if we do not declare the List as "final", we should not then declare the type of the second operand (element), but leave it as "dynamic"
  int v = aListnum.fold(
      0,
      (int previousValue, element) => (previousValue + element)
          as int); // cast to int each intermediate result

  num initVal = 0.0;
  //note: even if return type is 'int', we can use a 'num' parameter inside the function: num -> int
  int v2 = aListnum.fold(
      0, (num previousValue, element) => (previousValue + element) as int);

  //... but the contrary is not true: we cannot assume an 'int' parameter while the return type is 'num'
  //num v3 = aListnum.fold(initVal, (int previousValue, element) => (previousValue + element) as num);

  print("v: $v");
  print("v2: $v2");

  // Although a final object cannot be modified, its fields can be changed.
  // In comparison, a const object and its fields cannot be changed: they’re immutable.
  final aFinalListNum = <num>[1, 2, 3, 4];
  const aConstListNum = <num>[1, 2, 3, 4];

  print(aListnum..add(3)); // doable

  try {
    aConstListNum.add(3); // Raises an Error at run-time
  } catch (e) {
    print(e);
  }

  final String pippo = "Pippo";
  print(pippo);

  //pippo = "Topolino"; // a final variable can be only set once

  List l =  [1, 2, 3, -1];
  print(l.every((element) => element > 0));
}
