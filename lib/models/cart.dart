import 'package:flutter/material.dart';
import 'package:practice1/models/product_model.dart';
import 'package:provider/provider.dart';

class Cart with ChangeNotifier {
  List<ProductModel> _lsit1 = [];
  double price = 0.0;

  void add(ProductModel item) {
    _lsit1.add(item);
    price += item.price;
    notifyListeners();
  }

  int get count {
    return _lsit1.length;
  }

  double get totalPrice {
    return price;
  }
}
