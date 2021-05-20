import 'package:challange_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                child: Center(
                  child: Image.asset(
                    product.productImagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                product.productName,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(product.rate.toString()),
                    Expanded(child: SizedBox()),
                    Text(product.reviewsNumber,
                        style: TextStyle(
                            fontSize: 10, color: Color.fromRGBO(66, 78, 80, 1)))
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Text(
                    product.price,
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      product.oldPrice,
                      style: TextStyle(
                          color: Color.fromRGBO(153, 167, 176, 1),
                          fontSize: 8,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Expanded(child: SizedBox()),
                    Text(product.savedMoney,
                        style: TextStyle(
                            fontSize: 8, color: Color.fromRGBO(66, 78, 80, 1)))
                  ],
                ),
              ),
            ],
          ),
          product.descountPresent == null
              ? SizedBox()
              : Positioned(
                  right: 15,
                  top: 15,
                  child: Container(
                    width: 25,
                    height: 25,
                    color: Colors.blue.withOpacity(0.4),
                    child: Center(
                      child: Text(
                        product.descountPresent,
                        style: TextStyle(color: Colors.blue, fontSize: 10),
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
