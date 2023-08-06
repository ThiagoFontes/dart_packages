class PasswordEntrophy {
  PasswordEntrophy._();

  static final _uppercaseRange = r'A-Z';
  static final _lowercaseRange = r'a-z';
  static final _numberRange = r'0-9';
  static final Map<String, int> _rangesMap = {
    r'!-/': 15,
    r':-@': 7,
    r'[-`': 6,
    r'{-~': 4,
    r'¿-ÿ': 65,
    _lowercaseRange: 26,
    _uppercaseRange: 26,
    _numberRange: 10,
  };

  static BigInt _bigLog(BigInt value, BigInt logBase) {
    BigInt partial = value;
    BigInt integerValue = BigInt.from(0);

    while (partial >= logBase) {
      partial ~/= logBase;
      integerValue += BigInt.from(1);
    }

    return integerValue;
  }

  /// Given an plain text password entropy based on the lenght and pool of matching symbols
  /// This will not garantee your system security, but its a good way to inform the user
  /// about the strenght of the password
  /// retruns null if the password is invalid (has a special character not accounted for in this package)
  static int? entrophy(String? password) {
    if (password == null) return 0;

    final valid = validatePassword(password);
    if (!valid) return null;

    BigInt pool = BigInt.from(0);

    for (final entry in _rangesMap.entries) {
      final regex = '[${entry.key}]';
      if (password.contains(RegExp(regex))) {
        pool += BigInt.from(entry.value);
      }
    }

    final len = password.length;

    final BigInt exp = pool.pow(len);

    // final log2 = log(exp.toInt()) / log(2);
    final integer = _bigLog(exp, BigInt.from(2));

    return integer.toInt();
  }

  /// Not all ascii symbols are allowed in passwords with this package
  /// return either true of false if all characters are allowed
  static bool validatePassword(
    String? password, {
    int? minLenght,
    int? maxLenght,
  }) {
    if (password == null) return false;

    final length = password.length;

    if (minLenght != null && length < minLenght) {
      return false;
    }

    if (maxLenght != null && length > maxLenght) {
      return false;
    }

    final stringBuffer = StringBuffer();

    stringBuffer.write(r'^[');
    for (final value in _rangesMap.keys) {
      stringBuffer.write(value);
    }
    stringBuffer.write(r']+$');

    final valid = password.contains(RegExp(stringBuffer.toString()));

    return valid;
  }
}

extension PasswordEntrophyExtension on String? {
  ///true if the string contains at least one number
  bool get containsNumbers =>
      this?.contains(RegExp(PasswordEntrophy._numberRange)) ?? false;

  ///true if the string contains at least one lowercase character
  bool get containsLowercase =>
      this?.contains(RegExp(PasswordEntrophy._lowercaseRange)) ?? false;

  ///true if the string contains at least one lowercase character
  bool get containsUppercase =>
      this?.contains(RegExp(PasswordEntrophy._uppercaseRange)) ?? false;

  ///true if the string contains at least one valid symbol
  bool containsSymbols({String? regex}) {
    final symbols = PasswordEntrophy._rangesMap;
    symbols
      ..remove(PasswordEntrophy._uppercaseRange)
      ..remove(PasswordEntrophy._lowercaseRange)
      ..remove(PasswordEntrophy._numberRange);

    final anySymbol = symbols.keys.any(
      (element) => this?.contains(RegExp(regex ?? element)) ?? false,
    );

    return anySymbol;
  }

  /// Given an plain text password entropy based on the lenght and pool of matching symbols
  /// This will not garantee your system security, but its a good way to inform the user
  /// about the strenght of the password
  int? get passwordEntrophy => PasswordEntrophy.entrophy(this);

  /// Not all ascii symbols are allowed in passwords with this package
  /// return either true of false if all characters are allowed
  bool validatePassword({int? minLenght, int? maxLenght}) =>
      PasswordEntrophy.validatePassword(
        this,
        minLenght: minLenght,
        maxLenght: maxLenght,
      );
}
