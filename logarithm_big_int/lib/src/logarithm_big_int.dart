abstract class LogarithmBigInt {
  /// returns a BigInt that is the result
  /// for the logarihm of the [value] from the [logBase]
  static BigInt bigLog({required BigInt value, required BigInt logBase}) {
    BigInt partial = value;
    BigInt integerValue = BigInt.from(0);

    while (partial >= logBase) {
      partial ~/= logBase;
      integerValue += BigInt.from(1);
    }
    integerValue.toInt();

    return integerValue;
  }
}

extension LogarithmBigIntExtension on BigInt {
  /// returns a BigInt that is the result
  /// for the logarihm of the [value] from the [logBase]
  BigInt bigLog(BigInt logBase) =>
      LogarithmBigInt.bigLog(value: this, logBase: logBase);
}

extension ConvertToBigInt on num {
  /// Runs the factore BigInt.from on a num value
  BigInt get toBigInt => BigInt.from(this);
}
