import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemiderItem extends StatelessWidget {
  final String titel, subTitle, reminderImagepath;

  RemiderItem(this.titel, this.subTitle, this.reminderImagepath);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(reminderImagepath)),
              )),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ListTile(
                  title: Text(titel),
                  subtitle: Text(subTitle),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
