import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  // List of item on sale
  final List shopItem = [
    ["Avocado", "299", 'assets/images/avocado.png', Colors.green],
    ["Banana", "59", 'assets/images/banana.png', Colors.yellow],
    ["Chicken", "699", 'assets/images/chicken.png', Colors.brown],
    ["Water", "299", 'assets/images/water.png', Colors.green],
  ];

  get getShopItems {
    return shopItem;
  }

  // List of cart items

  List cartItem = [];    // takes same value as shopItem

  get cartItems => cartItem;

  // add item to cart
  void addItemToCart(int index){
    cartItem.add(shopItem[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(int index){
    cartItem.removeAt(index);
    notifyListeners();
  }

  // calculate total price
    String calculateTotal(){
      double totalPrice = 0;
      for(int i=0; i<cartItem.length; i++){
        totalPrice += double.parse(cartItem[i][1]);
      }
      return totalPrice.toString();
    }
}