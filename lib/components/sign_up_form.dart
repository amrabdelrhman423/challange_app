import 'package:challange_app/Providers/sign_up_provider.dart';
import 'package:challange_app/UI/Home/homePage.dart';
import 'package:challange_app/helper/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../constants.dart';
import 'default_button.dart';
import 'default_text_Field.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(),
      emailController = TextEditingController(),
      phoneController = TextEditingController(),
      passwordController = TextEditingController(),
      addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (ctx, signUpProvider, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildNameFormField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              buildPhoneFormField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              buildEmailFormField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              buildPasswordFormField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              buildAddressFormField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: signUpProvider.checkBoxValue,
                      activeColor: Color.fromRGBO(14, 105, 167, 1),
                      onChanged: signUpProvider.changeCheckBox),
                  Text("I have read and agree to the"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Terms and conditions",
                      style: TextStyle(
                          fontSize: 11.5, decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              Expanded(child: SizedBox()),
              DefaultButton(
                text: "Sign Up",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    if (signUpProvider.checkBoxValue == false) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("you should accept Terms and conditions"),
                        backgroundColor: Theme.of(context).errorColor,
                      ));
                    } else {
                      _formKey.currentState.save();
                      KeyboardUtil.hideKeyboard(context);

                      // if all are valid then go to Sing up in Firebase
                      await signUpProvider.signUp(
                          emailController.text.trim(), passwordController.text);

                      if (signUpProvider.isloging) {
                        print(signUpProvider.isloging);
                        Navigator.pushNamed(context, HomePage.routeName);
                      } else {
                        Toast.show(signUpProvider.error, context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      }
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

  TextFormField buildNameFormField() {
    return defaultTextField(
      controller: nameController,
      type: TextInputType.text,
      lable: "NAME",
      hintText: "Enter your Name",
      validate: (value) {
        if (value.isEmpty) {
          return kNamelNullError;
        } else if (value.length < 4) {
          return kNamelError;
        }
        return null;
      },
    );
  }

  TextFormField buildPhoneFormField() {
    return defaultTextField(
      controller: phoneController,
      type: TextInputType.phone,
      lable: "Phone Number",
      hintText: "Enter your phone",
      prefixText: "+2",
      suffix: Icon(
        Icons.assignment,
        color: cIcons,
      ),
      validate: (value) {
        if (value.isEmpty) {
          return kPhoneNumberNullError;
        } else if (value.length < 11) {
          print(value.length);
          return kPhoneNumberError;
        }
        return null;
      },
    );
  }

  TextFormField buildEmailFormField() {
    return defaultTextField(
      controller: emailController,
      type: TextInputType.emailAddress,
      lable: "EMAIL ADDRESS",
      hintText: "Enter your Email",
      suffix: Icon(
        Icons.assignment,
        color: cIcons,
      ),
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
      suffix: Icon(
        Icons.assignment,
        color: cIcons,
      ),
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

  TextFormField buildAddressFormField() {
    return defaultTextField(
      controller: addressController,
      type: TextInputType.streetAddress,
      lable: "ADDRESS",
      hintText: "Enter your Address",
      suffix: Icon(
        Icons.assignment,
        color: cIcons,
      ),
      validate: (value) {
        if (value.isEmpty) {
          return kAddressNullError;
        }
        return null;
      },
    );
  }
}
