import 'package:data/network/network.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Network network = Network(baseUrl: 'https://www.google.com/');
  test("Test Network", () async {
    var r = await network.get('');
    expect(r.toString().isNotEmpty, true);
  });
}
