import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  final void Function() onPressed;

  const GroceryItemTile({super.key, required this.itemName, required this.itemPrice, required this.imagePath, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(7)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image
            // Image(image: AssetImage(imagePath)), OR
            Image.asset(imagePath, height: 64,),
    
           // item name
           Text(itemName, style: const TextStyle(fontWeight: FontWeight.bold),),
    
          // item price + button
          MaterialButton(
            onPressed: onPressed,
            color: color[800],
            child: Text('₹ $itemPrice', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          )
          ],
        ),
        
      ),
    );
  }
}