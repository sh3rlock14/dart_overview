
/// Dart null-aware operators
/// this feature is a collection of syntactic sugar for traversing (potentially null)
/// objects calls, conditionally setting a variable, and evaluating two (potentially null) expressions
///

void main() {

  String? s; // note that String s is not-nullable
  var x;
  var y=5;

  /// if-null op
  /// `expr1 ?? expr2` evaluates to `expr1` if not null, otherwise `expr2`
  print(s ?? "New in Dart 1.12"); //The first operand must be a type that includes null (it does also include nullable var, e.g.: String? s)
  print(null ?? y);
  print(x ?? y);

  /// null-aware assignment
  /// `x ??= expr` causes `x` to be assigned `expr` only if `x` is `null`
  print(x??=y); //it makes the assignment even inside the print
  print(s??=(x+10).toString());


  int? a;
  a ??=3;
  print(a);

  a ??=5; //generates a warning
  print(a);

  /// Conditional-property access


  // This method should return the uppercase version of `str`
  // or null if `str` is null.
  String? upperCaseIt(String? str) {
    // Try conditionally accessing the `toUpperCase` method here.
    return str?.toUpperCase().toString();
  }

  String? s2;
  print(upperCaseIt(s2));
  s2??="test!";
  print("Before method invocation:" + s2.toString());
  print("Before method invocation:" + upperCaseIt(s2).toString()); //.toString() must be called since a string ("Before...") cannot be concatenated to null




}

