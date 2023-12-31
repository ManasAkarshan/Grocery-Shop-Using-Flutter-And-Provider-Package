import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/model.dart/cart_model.dart';
import 'package:grocery_shop/pages/cart_page.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return const CartPage();
          }));
        },
        child: const Icon(Icons.shopping_bag, color: Colors.white,),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  SizedBox(height: 30,),

              // Good morning
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text('Good Morning,'),
              ),
      
              // Let's order fresh items for you
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Let\'s order fresh items for you',
                  style: GoogleFonts.notoSerif(
                  fontSize: 37, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24,),

              // Divider

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),
              const SizedBox(height: 24,),
      
              // fresh items + grid
              const Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: Text(
                  'Fresh Items',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2
                    ), 
                    itemCount: 4,
                    itemBuilder: (context, index){
                      return GroceryItemTile(
                        itemName: value.shopItem[index][0],
                        itemPrice: value.shopItem[index][1],
                        imagePath: value.shopItem[index][2],
                        color: value.shopItem[index][3],
                        onPressed: (){
                          Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                        },
                      );
                    }
                  );
                })
              )

            ],
          ),
      ),
      );
  }
}