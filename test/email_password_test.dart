import 'package:SwoleSpartan/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('title', () {});

  test('empty mail returns error string', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'You need to provide an email to log in');
  });

  test('non-empty email returns null', () {
    var result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

  test('empty password returns error string', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'You need to provide a password to log in');
  });

  test('non-empty password returns null', () {
    var result = PasswordFieldValidator.validate('email');
    expect(result, null);
  });
}
