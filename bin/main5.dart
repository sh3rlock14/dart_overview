/// Cascades
/// To perform a sequence of operations on the same object, use cascades (..)

class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];

  // Add a "total" getter here:
  double get total => _prices.fold(0.0, (prev, elem) => (prev + elem));

  // Add a "prices" setter here:
  set prices(List <double> lis) {

    if (lis.every((e) => e>=0)) {
      _prices = lis;
    }
    else {
      throw InvalidPriceException();
    }
  }
}

class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }
}

BigObject fillBigObject(BigObject obj) {
  // Create a single statement that will update and return obj:
  return obj
    ..anInt = 1
    ..aString = "String!"
    ..aList = [3.0]
    ..allDone();
}


main() {
  
  BigObject obj;

  try {
    obj = fillBigObject(BigObject());
  } on UnimplementedError {
    print('Tried to call fillBigObject but failed. Did you implement the method?');
    return;
  } catch (e) {
    print('Caught an exception of type ${e.runtimeType} while running fillBigObject');
    return;
  }

  final errs = <String>[];

  if (obj.anInt != 1) {
    errs.add(
        'The value of anInt was ${obj.anInt} rather than the expected (1).');
  }

  if (obj.aString != 'String!') {
    errs.add(
        'The value of aString was \'${obj.aString}\' rather than the expected (\'String!\').');
  }

  if (obj.aList.length != 1) {
    errs.add(
        'The length of aList was ${obj.aList.length} rather than the expected value (1).');
  } else {
    if (obj.aList[0] != 3.0) {
      errs.add(
          'The value found in aList was ${obj.aList[0]} rather than the expected (3.0).');
    }
  }

  if (!obj._done) {
    errs.add('It looks like allDone() wasn\'t called.');
  }

  if (errs.isEmpty) {
    print("All tests passed!");
  } else {
    print(errs);
  }


  var foundException = false;

  try {
    final cart = ShoppingCart();
    cart.prices = [12.0, 12.0, -23.0];
  } on InvalidPriceException {
    foundException = true;
    print('Tried setting a negative price!');
  } catch (e) {
    print('Tried setting a negative price and received a ${e.runtimeType} instead of an InvalidPriceException.');
    return;
  }

  final secondCart = ShoppingCart();

  try {
    secondCart.prices = [1.0, 2.0, 3.0];
  } catch(e) {
    print('Tried setting prices with a valid list, but received an exception: ${e.runtimeType}.');
    return;
  }

  if (secondCart._prices.length != 3) {
    print('Tried setting prices with a list of three values, but _prices ended up having length ${secondCart._prices.length}.');
    return;
  }

  if (secondCart._prices[0] != 1.0 || secondCart._prices[1] != 2.0 || secondCart._prices[2] != 3.0) {
    final vals = secondCart._prices.map((p) => p.toString()).join(', ');
    print('Tried setting prices with a list of three values (1, 2, 3), but incorrect ones ended up in the price list ($vals) .');
    return;
  }

  var sum = 0.0;

  try {
    sum = secondCart.total;
  } catch (e) {
    print('Tried to get total, but received an exception: ${e.runtimeType}.');
    return;
  }

  if (sum != 6.0) {
    print('After setting prices to (1, 2, 3), total returned $sum instead of 6.');
    return;
  }

  print("All test passed for the second cart!");

}