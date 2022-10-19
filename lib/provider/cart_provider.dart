import 'package:dailefresh_interview/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart with ChangeNotifier {
  // ignore: deprecated_member_use
  List<Data> _items = [];

  double _price = 0.0;

  void addItem(String name, int id, String image) {
    _items.add(
      Data(
        productId: id,
        productName: name,
        productSmallImg: image,
      ),
    );
    print(_items);
    // _price += item.priceList![0].prodPriceId!;
    notifyListeners();
  }

  void removeItem(Data item) {
    _items.remove(item);
    print(_items);
    // _price -= item.priceList![0].prodPriceId;
    notifyListeners();
  }

  List<Data> get items {
    return _items;
  }

  int get count {
    return _items.length;
  }

  double get price {
    return _price;
  }

  var cart;

  getTotal() {
    num total = 0;
    cart.forEach((p) => total = total + p["total"]);
    // cart.refresh();

    return total;
  }

  getTotalQuantity() {
    num qty = 0;
    cart.forEach((p) => qty = qty + p["qty"]);
    // cart.refresh();

    return qty;
  }

  addToCart(input) {
    var index = cart.indexWhere((p) => p["id"] == input["id"]);
    print(index);
    if (index == -1) {
      input["total"] = input["qty"] * input["price"];
      cart.add(input);
    } else {
      cart[index]["total"] = cart[index]["total"] + cart[index]["price"];
      cart[index]["qty"] = cart[index]["qty"] + 1;
    }
    cart.refresh();
    print(cart);
  }

  clearCart() {
    cart.clear();
  }

  removeFromCart(input) {
    var index = cart.indexWhere((p) => p["id"] == input["id"]);
    if (index == -1) {
      print("no product is available to delete");
    } else {
      if (cart[index]["qty"] == 1) {
        cart.removeAt(index);
      } else {
        cart[index]["total"] = cart[index]["total"] - cart[index]["price"];
        cart[index]["qty"] = cart[index]["qty"] - 1;
      }
      cart.refresh();
      print(cart);
    }
  }
}
