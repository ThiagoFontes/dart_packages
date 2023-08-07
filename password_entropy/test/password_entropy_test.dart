import 'package:password_entropy/password_entropy.dart';
import 'package:test/test.dart';

void main() {
  group('Testing password entrophy', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('same case letters entrophy test', () {
      final mapPasswordsEntropy = <String, double>{
        'abcd': 18.80175887256437,
        'ABCD': 18.80175887256437,
        'PASS': 18.80175887256437,
        'nope': 18.80175887256437,
        'password': 37.60351774512874,
        'PASSWORD': 37.60351774512874,
        'passabcd': 37.60351774512874,
        'QWERPASS': 37.60351774512874,
      };

      for (final entry in mapPasswordsEntropy.entries) {
        expect(entry.key.passwordEntrophy, entry.value);
      }
    });

    test('Multiple case letters entrophy test', () {
      final mapPasswordsEntropy = <String, double>{
        'abCd': 22.80175887256437,
        'AaaD': 22.80175887256437,
        'PaSS': 22.80175887256437,
        'NOpe': 22.80175887256437,
        'Password': 45.60351774512874,
        'passWORD': 45.60351774512874,
        'pAssAbcd': 45.60351774512874,
        'QwerPass': 45.60351774512874,
      };

      for (final entry in mapPasswordsEntropy.entries) {
        expect(entry.key.passwordEntrophy, entry.value);
      }
    });

    test('Letters and number entrophy test', () {
      final mapPasswordsEntropy = <String, double>{
        'abCd2': 29.77098155193438,
        '1aaD': 23.816785241547503,
        'PaSS31': 35.72517786232125,
        'NOpe4': 29.77098155193438,
        'Passw0rd': 47.633570483095006,
        '123passWORD': 65.49615941425563,
        '4pAssAbcd': 53.58776679348188,
        'Qw3rP4ss': 47.633570483095006,
      };

      for (final entry in mapPasswordsEntropy.entries) {
        expect(entry.key.passwordEntrophy, entry.value);
      }
    });

    test('Add symbols test', () {
      final mapPasswordsEntropy = <String, double>{
        '123passWORD!': 75.20143848833882,
        ';323passWORD!': 83.10012649612388,
        ';323passWORDé!': 101.06835928647027,
        'rXY|,oQ&"b=MCx*_r"yk': 127.8463484555752,
        'Habakkuk-foreknow-zone-salvador': 188.04876490419093,
      };

      for (final entry in mapPasswordsEntropy.entries) {
        expect(entry.key.passwordEntrophy, entry.value);
      }
    });
  });
}
