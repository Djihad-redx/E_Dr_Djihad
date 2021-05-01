import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Models/Presceptionm.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrescriptionFarmacycheack extends StatefulWidget {

  PrescriptionFarmacycheack({this.result,this.mycontext});
  BuildContext mycontext;
  PrescriptionData result ;
  @override
  _PrescriptionFarmacycheackState createState() => _PrescriptionFarmacycheackState();
}

class _PrescriptionFarmacycheackState extends State<PrescriptionFarmacycheack> {

 bool isloading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                HeaderApp(Title: widget.result.patient,icon: Icons.arrow_back,c: context,),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(right: 20,left: 20,bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Pharmacy:',style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                          Text(widget.result.pharmacist,style: TextStyle(
                                            fontSize: 18,

                                          ),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Doctor:',style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                          Text(widget.result.doctor,style: TextStyle(
                                            fontSize: 18,
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.5,
                        margin: EdgeInsets.fromLTRB(20,10,20,10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100
                        ),
                        child: ListView.builder(
                          itemCount: widget.result.products.length,
                          itemBuilder: (context, index) {
                           return   Padding(
                             padding: const EdgeInsets.only(top: 10,bottom: 5,right: 10,left: 10),
                             child: Container(
                                 padding: EdgeInsets.fromLTRB(15, 7, 10, 15),
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(8)),
                                     color: Colors.grey.shade50
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       children: [

                                         Container(
                                             height: 60,
                                             width: 60,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                 color: Colors.white
                                             ),
                                             child: Icon(FontAwesomeIcons.bookMedical,size: 40,color: Colors.red,)),
                                         Padding(
                                           padding: const EdgeInsets.only(left:15),
                                           child: Container(
                                             width: MediaQuery.of(context).size.width*.3,
                                             child: Text(widget.result.products[index].name,style: TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 18,
                                                 color: Colors.black

                                             ),),
                                           ),
                                         )
                                       ],
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left:15,right: 15),
                                       child: Container(
                                         padding: EdgeInsets.all(8),
                                         decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Colors.red
                                         ),
                                         child: Center(
                                           child: Text(widget.result.products[index].qty.toString(),style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 18,
                                               color: Colors.white

                                           ),),
                                         ),
                                       ),
                                     )
                                   ],
                                 )
                             ),);
                         },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                child: Text('Note',style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                child: Text(widget.result.notes == null?'':widget.result.notes,style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey

                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(onTap: (){
                               if(widget.result.status =='Pending'){
                                 setState(() {
                                   isloading = true;
                                 });
                                 Api.CancelPrescription(widget.result.id.toString()).then((value) {
                                   if(value == true){
                                     AwesomeDialog(
                                       onDissmissCallback: (){
                                         Navigator.of(context).pop(true);
                                       },
                                       context: context,
                                       animType: AnimType.SCALE,
                                       dialogType: DialogType.SUCCES,
                                       body: Center(child: Text(
                                         " successfully",
                                         style: TextStyle(),
                                       ),),
                                     ).show();
                                   }else{
                                     AwesomeDialog(
                                       context: context,
                                       animType: AnimType.SCALE,
                                       dialogType: DialogType.ERROR,
                                       body: Center(child: Text(
                                         " fail",
                                         style: TextStyle(),
                                       ),),
                                     ).show();
                                   }
                                   setState(() {
                                     isloading = false;
                                   });

                                 });
                               }else{
                                 Fluttertoast.showToast(
                                     msg: "Prescription is already ended",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 1,
                                     backgroundColor: Colors.red,
                                     textColor: Colors.white,
                                     fontSize: 16.0
                                 );
                               }

                                },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                        color: Colors.red
                                    ),
                                    child: Center(
                                      child: Text('Cancel',style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(onTap: (){
                                  if(widget.result.status == 'Pending'){
                                    setState(() {
                                      isloading = true;
                                    });
                                    Api.finishPrescription(widget.result.id.toString()).then((value) {
                                      if(value == true){
                                        AwesomeDialog(
                                          onDissmissCallback: (){
                                            Navigator.of(widget.mycontext).pop(true);
                                          },
                                          context: context,
                                          animType: AnimType.SCALE,
                                          dialogType: DialogType.SUCCES,
                                          body: Center(child: Text(
                                            " successfully",
                                            style: TextStyle(),
                                          ),),
                                        ).show();
                                      }else{
                                        AwesomeDialog(

                                          context: context,
                                          animType: AnimType.SCALE,
                                          dialogType: DialogType.ERROR,
                                          body: Center(child: Text(
                                            " fail",
                                            style: TextStyle(),
                                          ),),
                                        ).show();
                                      }
                                      setState(() {
                                        isloading = false;
                                      });

                                    });
                                  }else{
                                    Fluttertoast.showToast(
                                        msg: "Prescription is already ended",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }

                                },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      color: Colors.green
                                    ),
                                    child: Center(
                                      child: Text('Finish',style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                      ),),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            isloading == true?Loading(): Container()
          ],
        ),
      ),
    );
  }
}
