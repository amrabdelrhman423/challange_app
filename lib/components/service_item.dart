import 'package:challange_app/model/service.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final Service service;

  const ServiceItem({this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 75,
          height: 75,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Image.asset(service.seviceImagePath),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(service.serviceName)
      ],
    );
  }
}
