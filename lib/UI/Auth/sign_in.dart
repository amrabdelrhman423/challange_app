import 'package:challange_app/Providers/sign_in_provider.dart';
import 'package:challange_app/components/banner_avatar.dart';
import 'package:challange_app/components/sing_in_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/Singin";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (context) => SignInProvider(),
      child: Consumer<SignInProvider>(
        builder: (ctx, signInProvider, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  bannerAvater(context),
                  Expanded(child: SignInForm())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
