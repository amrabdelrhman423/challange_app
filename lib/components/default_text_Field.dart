import 'package:flutter/material.dart';

Widget defaultTextField(
    {@required TextEditingController controller,
    @required TextInputType type,
    Icon suffix,
    @required Function validate,
    @required String lable,
    @required String hintText,
    bool obsecure = false,
    String sufixText,
    String prefixText,
    Function onTap}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validate,
    obscureText: obsecure,
    onTap: onTap,
    decoration: InputDecoration(
      suffixIcon: suffix,
      labelText: lable,
      hintText: hintText,
      prefixText: prefixText,
      suffixText: sufixText,
      suffixStyle: TextStyle(fontSize: 10),
      prefixStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      labelStyle: TextStyle(color: Color.fromRGBO(177, 177, 177, 1)),
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
