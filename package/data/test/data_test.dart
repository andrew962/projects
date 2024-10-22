import 'package:data/network/network.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test Network", () async {
    var r = await Network(baseUrl: 'https://www.google.com/').get(path: '');
    expect(r.toString().isNotEmpty, true);
  });
}
