import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/cart_card.dart';
import 'package:e_comerce/Screens/Helpers/check_out_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HeaderApp(c: context,Title: "Cart",icon: Icons.arrow_back,),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                      child: CartCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                      child: CartCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                      child: CartCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                      child: CartCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                      child: CartCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                      child: CartCard(),
                    ),
                  ],
                ),
              ),
              CheckoutCard(),
            ],
          ),
        ),
      ),
    );
  }
}
