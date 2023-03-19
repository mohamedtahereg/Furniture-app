import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice1/screens/intro.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
  // print(countPrice);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        getPages: [
          GetPage(name: "/", page: () => const IntroPage()),
          // GetPage(name: "/.", page: () => HomePage()),
          // GetPage(name: "/..", page: (() => ProductModel())),
        ],
      ),
    );
  }
}
