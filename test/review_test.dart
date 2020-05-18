import 'package:flutter_test/flutter_test.dart';

import 'package:SwoleSpartan/product_details_sub.dart';

void main() {
  test('Empty Review field returns error string', () {
    var result = ReviewFieldValidator.validate('');
    expect(result, 'This field cannot be empty');
  });

  test('Non-empty review field returns null', () {
    var result = ReviewFieldValidator.validate('Product Review');
    expect(result, null);
  });

  test('Non-empty alphanumeric review field returns null', () {
    var result = ReviewFieldValidator.validate('10/10');
    expect(result, null);
  });

}