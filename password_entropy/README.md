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
# password_entropy

![pub package](https://img.shields.io/pub/v/password_entropy.svg)](https://pub.dev/packages/password_entropy)

This package aims to calculate entrophy for plain text passwords, different implementations may have slighty different results from this package.

To use this package, add `password_entropy` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).


## Example

```dart
import 'package:password_entropy/password_entropy.dart';

void main() {
  //Use via extension method
  final int? entrophy1 = 'mYpassWord'.passwordEntrophy;
  print(entrophy1); // 57.00439718141092

  //Will return null for some special characters like '¬' (invalid password)
  final int? invalidPass = '(¬_¬)'.passwordEntrophy;
  print(invalidPass); // null

  //Use via static method
  final int? entrophy2 = PasswordEntrophy.entrophy('Password');
  print(entrophy2); // 45.60351774512874

  // Checking if password is valid

  print('(¬_¬)'.validatePassword()); // false
  print('(_pasword_)'.validatePassword()); // true
  print('(_pasword_)'.validatePassword(minLenght: 20)); // false

  //Also can be used as static method
  print(
    PasswordEntrophy.validatePassword(
      '(_pasword_)',
      maxLenght: 20,
      minLenght: 3,
    ),
  ); // true
}
```