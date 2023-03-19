import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice1/screens/home.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: .9,
              child: Image.asset(
                "assets/intro.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            right: 20,
            top: 40,
            child: Text(
              "Elegent\nfurniture\nfor you.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 70,
            child: GestureDetector(
              onTap: () {
                Get.off(HomePage());
              },
              child: Container(
                width: 90,
                height: 90,
                transform: Matrix4.rotationZ(12.3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff535353),
                ),
                child: const Center(
                  child: Text(
                    "Lets Go",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
