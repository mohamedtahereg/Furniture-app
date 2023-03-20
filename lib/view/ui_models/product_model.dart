import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel extends StatelessWidget {
  ProductModel({
    super.key,
    required this.productName,
    required this.price,
    required this.productType,
    required this.image,
  });
  factory ProductModel.fromFirebase(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs, int index) {
    return ProductModel(
      productName: "${docs[index]["productName"]}",
      price: "${docs[index]["price"]}",
      productType: "${docs[index]["productType"]}",
      image: "${docs[index]["image"]}",
    );
  }

  String? productName;
  String? productType;

  String? price;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
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
                  width: 170, height: 170, child: Image.network("$image")),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 160,
                width: 170,
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '$productType',
                          style: const TextStyle(color: Colors.black38),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('$productName',
                            style: const TextStyle(
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
                              "$price \$",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.add_shopping_cart_outlined,
                                color: Colors.blueAccent,
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
