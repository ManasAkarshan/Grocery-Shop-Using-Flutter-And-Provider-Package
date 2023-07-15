import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(
                top: 140, left: 70, bottom: 40, right: 70),
            child: Image.asset(
              'assets/images/avocado.png',
              height: 240,
            ),
          ),

          // we deliver at  your doorsteps
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              "We deliver groceries at your doorsteps",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 37, fontWeight: FontWeight.bold),
            ),
          ),

          // fresh items everyday
          Text(
            'Fresh items everyday',
            style: TextStyle(color: Colors.grey[700]),
          ),

          const Spacer(),

          // get started button
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context){return HomePage()}));   OR
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
