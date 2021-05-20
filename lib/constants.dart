import 'package:flutter/material.dart';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kNamelError = "Please Enter Corect name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kPhoneNumberError = "Please Enter Correct phone number";
const String kAddressNullError = "Please Enter your address";
const Color cIcons = Color.fromRGBO(165, 165, 165, 1);
