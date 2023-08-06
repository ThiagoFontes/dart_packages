import 'package:logarithm_big_int/logarithm_big_int.dart';

void main() {
  BigInt? logResult;
  // Using extension to calculate log10, with base 10
  logResult = LogarithmBigInt.bigLog(value: 10.toBigInt, logBase: 10.toBigInt);

  // logResult:1 | result on calculator 1
  print(logResult);

  // Using extension method to calculate log101, with base 4
  // You can create a BigInt using the from factory: BigInt.from(x)
  // or using the extension x.toBinInt
  logResult = BigInt.from(101).bigLog(4.toBigInt);

  // logResult:3 | result on calculator 3,3291057413758973685858295567452
  print(logResult);
}
