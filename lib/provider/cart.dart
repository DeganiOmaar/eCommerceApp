import 'package:flutter/material.dart';
import 'package:test3/model/item.dart';

class Cart with ChangeNotifier {
  List selectedProduct = [];

  double price = 0;

  add(Item product) {
    selectedProduct.add(product);
    price += product.price.round();
    notifyListeners();
  }

  delete(Item product) {
    selectedProduct.remove(product);
    price -= product.price.round();
    notifyListeners();
  }
}
