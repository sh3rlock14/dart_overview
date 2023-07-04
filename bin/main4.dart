/// Collection literals
/// Dart has built-in support for lists, maps, and sets. You can create them using literals


main() {

  // Dart’s type inference can assign types to these variables for you
  final aListOfStrings = ["Ciao", "come", "va", "?"];
  final aSetOfStrings = {"one", "two", "three"};
  final aMapOfStringsToInt = {
    "one" : 1,
    "two" : 2,
    "three" : 3
  };

// Or you can specify the type
  final aListOfInts = <int>[];
  final aSetOfInts = <String>{};
  final aMapOfIntsToStrings = <int, String>{
    1 : "one",
    2 : "two",
    3 : "three",
  };

  /// Specifying types is handy when you initialize a list with contents of a subtype, but still want the list to be List<BaseType>
//final aListOfBaseType = <BaseType>[SubType(), SubType()];
  final aListOfNums = <num>[1,2,3,4.5,6]; //This way I can store both int and double
  print(aListOfNums);


  

}

