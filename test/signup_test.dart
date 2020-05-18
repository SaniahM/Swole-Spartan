import 'package:flutter_test/flutter_test.dart';

import 'package:SwoleSpartan/signup.dart';

void main() {
  test('title', () {});

  test('empty first name returns error string', () {
    var result = FirstNameFieldValidator.validate('');
    expect(result, 'First Name cannot be empty');
  });

  test('non-empty first name returns null', () {
    var result = FirstNameFieldValidator.validate('FirstName');
    expect(result, null);
  });

  test('empty last name returns error string', () {
    var result = LastNameFieldValidator.validate('');
    expect(result, 'Last Name cannot be empty');
  });

  test('non-empty last name returns null', () {
    var result = LastNameFieldValidator.validate('LastName');
    expect(result, null);
  });

  test('empty phone number returns error string', () {
    var result = PhoneFieldValidator.validate('');
    expect(result, "Invalid Phone Number");
  });

  test('non-empty phone number returns null', () {
    var result = PhoneFieldValidator.validate('LastName');
    expect(result, 'Invalid Phone Number');
  });

  test('empty email address returns error string', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email Address cannot be empty');
  });

  test('non-empty email address returns null', () {
    var result = EmailFieldValidator.validate('LastName');
    expect(result, null);
  });

  test('empty password returns error string', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, "The password must be at least 8 characters long");
  });

  test('non-empty phone number returns null', () {
    var result = PasswordFieldValidator.validate('LastName');
    expect(result, null);
  });

  test('empty password returns error string', () {
    var result = AddressFieldValidator.validate('');
    expect(result, "The address must be at least 5 characters long");
  });

  test('non-empty phone number returns null', () {
    var result = AddressFieldValidator.validate('LastName');
    expect(result, null);
  });
}
