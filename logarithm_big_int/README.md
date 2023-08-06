<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# logarithm_big_int

[![pub package](https://img.shields.io/pub/v/logarithm_big_int.svg)](https://pub.dev/packages/logarithm_big_int)

A way to calculate logarithm with a bigInt value given a the base also in bigInt, note that the returned value will be also a bigInt so the decimal values will be lost.

To use this package, run `dart pub add password_entropy` to add as a dependency in your pubspec.yaml file or `flutter pub add password_entropy` on a flutter project.


## Example

```dart
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
```
