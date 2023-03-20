import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddProductMethods {
  AddProductSubmit({
    required File image,
    required String title,
    required String catagory,
    required String price,
  }) async {
    final ref = FirebaseStorage.instance.ref().child('image').child(title);
    await ref.putFile(image);
    final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('products').doc(title).set({
      "productName": title,
      "price": price,
      "productType": catagory,
      "image": url,
    });
  }
}
