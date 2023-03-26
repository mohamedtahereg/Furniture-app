import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice1/view/screens/add_product.dart';

import '../view/screens/home.dart';
import '../view/screens/login.dart';

class AuthMethod {
  void signUp(
      {required String email,
      required File image,
      required String password,
      required BuildContext ctx,
      @required String? username}) async {
    String message = "";
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      // <جزء الصورة >//
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child(userCredential.user!.uid);
      await ref.putFile(image);
      final url = await ref.getDownloadURL();
      // </جزء الصورة >//
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        "username": username,
        "password": password,
        "image_url": url,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (image == null) {}
      Get.off(() => SignIn());
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        // backgroundColor: Theme.of(ctx).colorScheme.error,
        backgroundColor: Colors.black,
      ));
    } catch (e) {
      // print(e);
    }
  }

  void logIn({
    required String email,
    required String password,
    required BuildContext ctx,
  }) async {
    String message = "";
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.uid == "A5oncFI7gqZF2qgH6HiKwzUBJVM2") {
        Get.to(() => AddProductPage());
      } else {
        Get.off(() => HomePage());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(
          message,
        ),
        // backgroundColor: Theme.of(ctx).colorScheme.error,
        backgroundColor: Colors.black,
      ));
    }
  }
}
