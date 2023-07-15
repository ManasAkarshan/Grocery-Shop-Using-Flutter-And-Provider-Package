import 'package:flutter/material.dart';
import 'package:grocery_shop/model.dart/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child){
          return value.cartItem.isNotEmpty ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 7,),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text("My Cart", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItem.length,
                  itemBuilder: (context, index){
                    return Container(
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItem[index][2],
                          height: 36,
                        ),
                        title: Text(
                          value.cartItem[index][0],
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        subtitle: Text(
                          '₹ ' + value.cartItem[index][1],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          onPressed: (){
                            Provider.of<CartModel>(context, listen: false).removeFromCart(index);
                          },
                          icon: const Icon(Icons.delete)
                        ),
                      ),
                    );
                }),
              ),

              // Total price and pay now
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(14)
                  ),
                  padding: EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Total Price" ,style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.white),),
                            const SizedBox(height: 5,),
                            Text("₹ ${value.calculateTotal()}", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15 ,color: Colors.white),)
                          ],
                        ),
                      Container(
                        padding: const EdgeInsets.only(left: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          children: [
                            const Text('Pay', style: TextStyle(color: Colors.white, fontSize: 18),),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ) : const Center(
            child: Text('Add Something to cart', style: TextStyle(fontSize: 20),)
          );
        }
      )
    );
  }
}