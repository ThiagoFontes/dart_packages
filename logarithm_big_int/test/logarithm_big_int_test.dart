import 'package:logarithm_big_int/logarithm_big_int.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Calculate logarithms', () {
      List<({BigInt value, BigInt base, double result})> values = [
        (
          value: 10.toBigInt,
          base: 10.toBigInt,
          result: 1,
        ),
        (
          value: 1133.toBigInt,
          base: 2.toBigInt,
          result: 10.145932145820515637260235860156
        ),
        (
          value: 8455742254424.toBigInt,
          base: 8.toBigInt,
          result: 14.314356180070492568714359515064,
        ),
        (
          value: 1.toBigInt,
          base: 5.toBigInt,
          result: 0,
        ),
        (
          value: 1.toBigInt,
          base: 10.toBigInt,
          result: 0,
        ),
        (
          value: 1588889988888.toBigInt,
          base: 12.toBigInt,
          result: 11.305880150693760157433025486197,
        ),
        (
          value: 1755526554455655528.toBigInt,
          base: 64.toBigInt,
          result: 10.101101587809681799628006458237,
        ),
      ];

      for (final entry in values) {
        final staticValue = LogarithmBigInt.bigLog(
          value: entry.value,
          logBase: entry.base,
        );
        final extensionValue = entry.value.bigLog(entry.base);

        expect(staticValue, extensionValue);
        expect(extensionValue, entry.result.toBigInt);
      }
    });
  });
}
