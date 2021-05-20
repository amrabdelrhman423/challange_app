import "package:flutter/material.dart";

Widget bannerAvater(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.18,
    decoration: BoxDecoration(color: Color.fromRGBO(14, 105, 167, 1)),
    child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Image.asset(
          'assets/circle.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  );
}
