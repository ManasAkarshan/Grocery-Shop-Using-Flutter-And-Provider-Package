import 'package:flutter/material.dart';
import 'package:grocery_shop/model.dart/cart_model.dart';
import 'package:grocery_shop/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(                // For multiple providers
      providers: [
        ChangeNotifierProvider(
          create: (context)=>CartModel()
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );

    // OR

    // ChangeNotifierProvider(              // For single provider
    //   create: (context) => CartModel(),
    //   child: const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: IntroPage(),
    //   ),
    // );
  }
}