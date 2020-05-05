import 'package:bytebank2/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return tha value create a transaction', (){
    final transaction = Transaction(null, 200, null);
    expect(transaction.value, 200);
  });
  test('Should show error when create transaction with value less than zero', (){
    expect(() => Transaction(null, 0, null), throwsAssertionError);
  });
}