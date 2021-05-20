import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            color: Color.fromRGBO(14, 105, 167, 1),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
