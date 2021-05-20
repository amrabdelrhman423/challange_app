import 'package:challange_app/UI/Home/homePage.dart';
import 'package:flutter/material.dart';

import 'UI/Auth/sign_in.dart';
import 'UI/Auth/sign_up.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomePage.routeName: (context) => HomePage(),
};
