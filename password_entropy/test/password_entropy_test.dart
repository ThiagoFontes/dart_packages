import 'package:password_entropy/password_entropy.dart';
import 'package:test/test.dart';

void main() {
  group('Testing password entrophy', () {
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

  group('Test password validation', () {
    test('Check valid symbols', () {
      final String allValidSymbolsString =
          '''!"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789''';
      final listOfValidCharacters = <String>[];

      for (final entry in PasswordEntrophy.rangesMap.keys) {
        final startIndex = entry.codeUnits.first;
        final endIndex = entry.codeUnits.last;

        for (int i = startIndex; i <= endIndex; i++) {
          listOfValidCharacters.add(String.fromCharCode(i));
        }
      }

      final stringFromRegexRanges = listOfValidCharacters.join();

      expect(stringFromRegexRanges, allValidSymbolsString);
      expect(allValidSymbolsString.validatePassword(), true);
    });

    test('Check invalid ascii symbols', () {
      final String asciTableString =
          String.fromCharCodes(List.generate(256, (index) => index));

      expect(asciTableString.validatePassword(), false);
    });

    test('PasswordValidation with lenght', () {
      final String password = 'password';

      expect(password.validatePassword(), true);
      expect(password.validatePassword(minLenght: 10), false);
      expect(password.validatePassword(maxLenght: 7), false);
      expect(password.validatePassword(minLenght: 6, maxLenght: 8), true);
    });

    test('Check contains functions', () {
      final string1 = 'string';
      final string2 = 'AAAABBBB';
      final string3 = '124151';
      final string4 = '@!;}])*¨%';
      final string5 = '!aA3';

      expect(string1.containsNumbers, false);
      expect(string1.containsLowercase, true);
      expect(string1.containsUppercase, false);
      expect(string1.containsSymbols(), false);

      expect(string2.containsNumbers, false);
      expect(string2.containsLowercase, false);
      expect(string2.containsUppercase, true);
      expect(string2.containsSymbols(), false);

      expect(string3.containsNumbers, true);
      expect(string3.containsLowercase, false);
      expect(string3.containsUppercase, false);
      expect(string3.containsSymbols(), false);

      expect(string4.containsNumbers, false);
      expect(string4.containsLowercase, false);
      expect(string4.containsUppercase, false);
      expect(string4.containsSymbols(), true);

      expect(string5.containsNumbers, true);
      expect(string5.containsLowercase, true);
      expect(string5.containsUppercase, true);
      expect(string5.containsSymbols(), true);
    });
  });
}
