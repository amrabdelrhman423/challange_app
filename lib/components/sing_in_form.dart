import 'package:challange_app/Providers/sign_in_provider.dart';
import 'package:challange_app/UI/Auth/sign_up.dart';
import 'package:challange_app/UI/Home/homePage.dart';
import 'package:challange_app/helper/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../constants.dart';
import 'default_button.dart';
import 'default_text_Field.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(),
      passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (ctx, signInProvider, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              buildPasswordFormField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              // go to SingUp Screen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don`t have an account ?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: Text(
                      "Sign up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              //  social media SingIn
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () async {
                        await signInProvider.singWithFacebook();
                        if (signInProvider.isloging) {
                          Navigator.pushNamed(context, HomePage.routeName);
                        } else {
                          Toast.show(signInProvider.error, context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      },
                      child:
                          Container(child: Image.asset("assets/facebook.png"))),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                      onTap: () async {
                        await signInProvider.signInWithGoogle();
                        if (signInProvider.isloging) {
                          Navigator.pushNamed(context, HomePage.routeName);
                        } else {
                          Toast.show(signInProvider.error, context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      },
                      child: Container(child: Image.asset("assets/gmail.png"))),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              DefaultButton(
                text: "Sign In",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    KeyboardUtil.hideKeyboard(context);

                    // if all are valid then go to Sign in Firebase

                    await signInProvider.signIn(
                        emailController.text, passwordController.text);

                    if (signInProvider.isloging) {
                      Navigator.pushNamed(context, HomePage.routeName);
                    } else {
                      Toast.show(signInProvider.error, context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return defaultTextField(
      controller: emailController,
      type: TextInputType.emailAddress,
      lable: "EMAIL ADDRESS",
      hintText: "Enter your Email",
      validate: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return defaultTextField(
      controller: passwordController,
      type: TextInputType.text,
      obsecure: true,
      lable: "PASSWORD",
      hintText: "Enter your Password",
      sufixText: "Forgot Password",
      validate: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
    );
  }
}
