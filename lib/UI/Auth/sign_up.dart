import 'package:challange_app/Providers/sign_up_provider.dart';
import 'package:challange_app/components/banner_avatar.dart';
import 'package:challange_app/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/Singup";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(
      create: (context) => SignUpProvider(),
      child: Consumer<SignUpProvider>(
        builder: (ctx, signUpProvider, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  bannerAvater(context),
                  Expanded(child: SignUpForm()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
