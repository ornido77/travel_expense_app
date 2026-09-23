import 'package:flutter_test/flutter_test.dart';
import 'package:travel_expense_app/core/utils/validators.dart';

void main() {
  test('email validator rejects invalid email', () {
    expect(
      validateEmail('not-an-email'),
      'Enter a valid email address.',
    );
  });

  test('amount validator rejects zero', () {
    expect(
      validateAmount('0'),
      'Amount must be greater than zero.',
    );
  });

  test('password validator accepts a valid password', () {
    expect(
      validatePassword('password123'),
      isNull,
    );
  });
}
