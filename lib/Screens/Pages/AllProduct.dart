import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

import 'Add_To_Cart_Page.dart';

class AllProducts extends StatefulWidget {
  AllProducts ({this.mycontext});
  BuildContext mycontext;
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [

            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25,bottom: 10),
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 10),
                        child: Icon(
                          FontAwesomeIcons.search,
                          color: Colors.black,
                        ),
                      ),
                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 8, 8),
                            child: TextField(
                              // controller: Controler,
                              decoration: InputDecoration(
                                  hintText:LocaleKeys.Searche.tr(), border: InputBorder.none),
                            ),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 0,left: 15,right: 15),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:(80/160),

                    ),
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                height: MediaQuery.of(context).size.height*.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey.shade200,
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/testimg.jpg'),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('sepette 12% indirem',style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),textAlign: TextAlign.left,),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('\$150 USD',style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),textAlign: TextAlign.left,),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('\$250 USD',style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough
                                  ),textAlign: TextAlign.left,),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text('AirPod 2020',style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),textAlign: TextAlign.left,),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddToCartPage(),));

                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10,right: 10,top: 5),
                                  height: 40,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                  color: Colors.grey.shade200
                                ),
                                child: Center(
                                  child: Text('Add to Cart',style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
