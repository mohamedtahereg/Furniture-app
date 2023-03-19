import 'package:flutter/material.dart';

import 'package:practice1/models/cart.dart';
import 'package:practice1/screens/ourProducts/popularList.dart';
import 'package:provider/provider.dart';

class ProductModel extends StatelessWidget {
  ProductModel({
    super.key,
    required this.productName,
    required this.numberOfStrars,
    required this.price,
    required this.productType,
    required this.image,
    required this.myIndex,
  });

  String? productName;
  String? productType;
  int? numberOfStrars;
  double price;
  String? image;
  int myIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Container(
        width: 170,
        height: 300,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 270,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 20,
              child: SizedBox(
                  width: 170, height: 170, child: Image.asset("${image}")),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 160,
                width: 170,
                // color: Colors.red,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '$productType',
                          style: TextStyle(color: Colors.black38),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('$productName',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(
                          height: 7,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              size: 17,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${price} \$",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Consumer<Cart>(
                              builder: (context, cart, child) => InkWell(
                                onTap: () {
                                  print(myIndex);
                                  cart.add(lsit1[myIndex]);
                                },
                                child: const Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
