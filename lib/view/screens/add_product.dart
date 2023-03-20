import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice1/constants.dart';
import 'package:practice1/view/ui_models/textField.dart';

import '../../services/add_product_method.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  File? image;

  final imagePiker = ImagePicker();

  uploadImageFromPhotos() async {
    var pikedImage = await imagePiker.pickImage(source: ImageSource.gallery);
    if (pikedImage != null) {
      setState(() {
        image = File(pikedImage.path);
      });
    } else {}
  }

  String? title, price, catagory;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formState,
          child: ListView(
            children: [
              const Text(
                "Add Product",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              ),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        image == null
                            ? SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: Image.network(
                                    "https://cdn.learnwoo.com/wp-content/uploads/2016/11/Adding-Products_Cropped.png"),
                              )
                            : SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: Image.file(image!),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                uploadImageFromPhotos();
                              },
                              icon:
                                  const Icon(Icons.photo, color: Colors.black),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
              MyTextField(
                textFieldIcon: const Icon(Icons.text_fields),
                fieldName: "Product Title",
                onSaved: (p0) {
                  title = p0;
                },
              ),
              MyTextField(
                textFieldIcon: const Icon(Icons.text_fields),
                fieldName: "Catagory",
                onSaved: (p0) {
                  catagory = p0;
                },
              ),
              MyTextField(
                textFieldIcon: const Icon(Icons.text_fields),
                fieldName: "Price",
                onSaved: (p0) {
                  price = p0;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: () {
                    AddProductMethods().AddProductSubmit(
                        image: image!,
                        title: title!,
                        catagory: catagory!,
                        price: price!);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          offset: Offset(10, 10),
                          color: Colors.grey,
                          spreadRadius: -2,
                        ),
                      ],
                    ),
                    child: const Text(
                      "Add Product",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
