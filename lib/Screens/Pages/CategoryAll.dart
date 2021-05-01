import 'package:e_comerce/Screens/Pages/Add_To_Cart_Page.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
class CategoryAll extends StatefulWidget {
  @override
  _CategoryAllState createState() => _CategoryAllState();
}

class _CategoryAllState extends State<CategoryAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:20,right: 20),
     child: Column(
       children: [
         Container(
           margin: EdgeInsets.only(left: 0, right: 0,bottom: 10),
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
           child: ListView(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top:5.0,bottom: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                       onTap: (){

                       },
                       child: Text('for you',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Show All',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15),
                 child: Row(children: [
                   Expanded(
                     child: InkWell(
                       onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddToCartPage(),));
                       },
                       child: Column(
                         children: [
                           Container(
                             margin: EdgeInsets.all(10),
                             height: MediaQuery.of(context).size.height*.3,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(10)),
                               color: Colors.grey.shade200,
                               image: DecorationImage(
                                   image: AssetImage('assets/images/img08.jpg'),
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
                           )
                         ],
                       ),
                     ),
                   ),
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img09.webp'),
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
                             child: Text('Galaxy Note 10 ultra',style: TextStyle(
                               fontSize: 12,
                               color: Colors.black,
                             ),textAlign: TextAlign.left,),
                           ),
                         )
                       ],
                     ),
                   )
                 ],),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:5.0,bottom: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Recently viewed',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Show All',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15),
                 child: Row(children: [
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img08.jpg'),
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
                         )
                       ],
                     ),
                   ),
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img09.webp'),
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
                             child: Text('Galaxy Note 10 ultra',style: TextStyle(
                               fontSize: 12,
                               color: Colors.black,
                             ),textAlign: TextAlign.left,),
                           ),
                         )
                       ],
                     ),
                   )
                 ],),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:5.0,bottom: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Phones',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Show All',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15),
                 child: Row(children: [
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img08.jpg'),
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
                         )
                       ],
                     ),
                   ),
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img09.webp'),
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
                             child: Text('Galaxy Note 10 ultra',style: TextStyle(
                               fontSize: 12,
                               color: Colors.black,
                             ),textAlign: TextAlign.left,),
                           ),
                         )
                       ],
                     ),
                   )
                 ],),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:5.0,bottom: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Televizyon',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Show All',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15),
                 child: Row(children: [
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img08.jpg'),
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
                         )
                       ],
                     ),
                   ),
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img09.webp'),
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
                             child: Text('Galaxy Note 10 ultra',style: TextStyle(
                               fontSize: 12,
                               color: Colors.black,
                             ),textAlign: TextAlign.left,),
                           ),
                         )
                       ],
                     ),
                   )
                 ],),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:5.0,bottom: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Home shop',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Show All',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15),
                 child: Row(children: [
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img08.jpg'),
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
                         )
                       ],
                     ),
                   ),
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img09.webp'),
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
                             child: Text('Galaxy Note 10 ultra',style: TextStyle(
                               fontSize: 12,
                               color: Colors.black,
                             ),textAlign: TextAlign.left,),
                           ),
                         )
                       ],
                     ),
                   )
                 ],),
               ),
               Padding(
                 padding: const EdgeInsets.only(top:5.0,bottom: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Books',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                     InkWell(
                       onTap: (){

                       },
                       child: Text('Show All',style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 17
                       ),),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 15),
                 child: Row(children: [
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img08.jpg'),
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
                         )
                       ],
                     ),
                   ),
                   Expanded(
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.all(10),
                           height: MediaQuery.of(context).size.height*.3,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Colors.grey.shade200,
                             image: DecorationImage(
                                 image: AssetImage('assets/images/img09.webp'),
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
                             child: Text('Galaxy Note 10 ultra',style: TextStyle(
                               fontSize: 12,
                               color: Colors.black,
                             ),textAlign: TextAlign.left,),
                           ),
                         )
                       ],
                     ),
                   )
                 ],),
               ),
             ],
           ),
         ),
       ],
     ),
    );
  }
}
