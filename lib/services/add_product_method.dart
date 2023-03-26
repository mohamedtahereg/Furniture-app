import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:practice1/constants.dart';

class AddProductMethods {
  AddProductSubmit({
    required File image,
    required String title,
    required String catagory,
    required String price,
    required BuildContext ctx,
  }) async {
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
          content: Row(
        children: [
          Text("Adding Product"),
          SizedBox(
            width: 20,
          ),
          CircularProgressIndicator(
            color: mainColor,
          ),
        ],
      )),
    );

    final ref = FirebaseStorage.instance.ref().child('image').child(title);
    await ref.putFile(image);
    final url = await ref.getDownloadURL();
    await FirebaseFirestore.instance.collection('chairs').doc(title).set({
      "productName": title,
      "price": price,
      "productType": catagory,
      "image": url,
    });
    ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
      content: Text("Added Successfuly"),
      duration: Duration(seconds: 1),
    ));
  }
}
