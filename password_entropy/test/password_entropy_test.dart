import 'package:password_entropy/password_entropy.dart';
import 'package:test/test.dart';

void main() {
  group('Testing password entrophy', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('same case letters entrophy test', () {
      final mapPasswordsEntropy = <String, int>{
        'abcd': 18,
        'ABCD': 18,
        'PASS': 18,
        'nope': 18,
        'password': 37,
        'PASSWORD': 37,
        'passabcd': 37,
        'QWERPASS': 37,
      };

      for (final entry in mapPasswordsEntropy.entries) {
        expect(entry.key.passwordEntrophy, entry.value);
      }
    });

    test('Multiple case letters entrophy test', () {
      final mapPasswordsEntropy = <String, int>{
        'abCd': 22,
        'AaaD': 22,
        'PaSS': 22,
        'NOpe': 22,
        'Password': 45,
        'passWORD': 45,
        'pAssAbcd': 45,
        'QwerPass': 45,
      };

      for (final entry in mapPasswordsEntropy.entries) {
        expect(entry.key.passwordEntrophy, entry.value);
      }
    });

    test('Letters and number entrophy test', () {
      final mapPasswordsEntropy = <String, double>{
        'abCd2': 29,
        '1aaD': 23,
        'PaSS31': 35,
        'NOpe4': 29,
        'Passw0rd': 47,
        '123passWORD': 65,
        '4pAssAbcd': 53,
        'Qw3rP4ss': 47,
      };

      for (final entry in mapPasswordsEntropy.entries) {
        expect(entry.key.passwordEntrophy, entry.value);
      }
    });

    test('Add symbols test', () {
      final mapPasswordsEntropy = <String, double>{
        '123passWORD!': 75,
        ';323passWORD!': 83,
        ';323passWORDé!': 101,
        'rXY|,oQ&"b=MCx*_r"yk': 127,
      };

      for (final entry in mapPasswordsEntropy.entries) {
        expect(entry.key.passwordEntrophy, entry.value);
      }
    });
  });
}
