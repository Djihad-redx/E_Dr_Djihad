import 'package:e_comerce/Screens/Helpers/DrawerScreen.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AddToCartPage extends StatefulWidget {
  @override
  _AddToCartPageState createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerScreen(),
        body: SafeArea(
          child: Column(
            children: [
              HeaderApp(iconcart: Icons.shopping_cart,icon: Icons.arrow_back,c: context,Title: "Add to Cart",),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10,left: 10,top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20,bottom: 5),
                            width: double.infinity,
                            child: Center(
                              child: Text('Product Name',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black
                              ),),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0,bottom: 5),
                            width: double.infinity,
                            child: Center(
                              child: Text('Sale 12%',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.green
                              ),),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),

                            width: double.infinity,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/img4.jpg'),
                                fit: BoxFit.cover,
                              ),


                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
                      padding: EdgeInsets.only(bottom: 20),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(1, 5), // changes position of shadow
                          ),
                        ],

                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:10.0,left: 20,right: 20),
                            child: Container(
                              width: double.infinity,
                              child: Text("Description:",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10.0,left: 20,right: 20),
                            child: Text("is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more",style: TextStyle(
                                fontSize: 16,

                                color: Colors.grey
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,20,15),
                      child: Text('45\$',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),textAlign: TextAlign.end,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20,bottom: 20),
                            height: 60,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(35)),
                              color: Colors.red
                            ),
                            child: Center(
                              child: Text('ADD TO CART',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20,bottom: 25,right: 20),

                          height: 40,
                          width: 130,
                         // color: Colors.red,
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: (){

                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomLeft: Radius.circular(20))
                                      ),
                                      child: Icon(FontAwesomeIcons.plus,size: 25,),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    color: Colors.grey.shade200,
                                    child: Center(
                                      child: Text("1",style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){

                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20)),
                                        color: Colors.grey.shade200
                                      ),
                                      child: Icon(FontAwesomeIcons.minus,size: 25,),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
