// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:logarithm_big_int/logarithm_big_int.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Calculate logarithms', () {
      List<_TestValues> values = [
        _TestValues(
          value: 10.toBigInt,
          baseValue: 10.toBigInt,
          result: 1,
        ),
        _TestValues(
            value: 1133.toBigInt,
            baseValue: 2.toBigInt,
            result: 10.145932145820515637260235860156),
        _TestValues(
          value: 8455742254424.toBigInt,
          baseValue: 8.toBigInt,
          result: 14.314356180070492568714359515064,
        ),
        _TestValues(
          value: 1.toBigInt,
          baseValue: 5.toBigInt,
          result: 0,
        ),
        _TestValues(
          value: 1.toBigInt,
          baseValue: 10.toBigInt,
          result: 0,
        ),
        _TestValues(
          value: 1588889988888.toBigInt,
          baseValue: 12.toBigInt,
          result: 11.305880150693760157433025486197,
        ),
        _TestValues(
          value: 1755526554455655528.toBigInt,
          baseValue: 64.toBigInt,
          result: 10.101101587809681799628006458237,
        ),
      ];

      for (final entry in values) {
        final staticValue = LogarithmBigInt.bigLog(
          value: entry.value,
          logBase: entry.baseValue,
        );
        final extensionValue = entry.value.bigLog(entry.baseValue);

        expect(staticValue, extensionValue);
        expect(extensionValue, entry.result.toBigInt);
      }
    });
  });
}

class _TestValues {
  final BigInt value;
  final BigInt baseValue;
  final double result;

  _TestValues({
    required this.value,
    required this.baseValue,
    required this.result,
  });
}
