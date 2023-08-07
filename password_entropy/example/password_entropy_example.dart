import 'package:password_entropy/password_entropy.dart';

void main() {
  //Use via extension method
  final double? entrophy1 = 'mYpassWord'.passwordEntrophy;
  print(entrophy1); // 57.00439718141092

  //Will return null for some special characters like '¬' (invalid password)
  final double? invalidPass = '(¬_¬)'.passwordEntrophy;
  print(invalidPass); // null

  //Use via static method
  final double? entrophy2 = PasswordEntrophy.entrophy('Password');
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
