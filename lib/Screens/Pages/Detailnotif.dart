import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:e_comerce/Utlitis/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
class Detailnotif extends StatefulWidget {

  BuildContext mycontext;
  int ID;
  Detailnotif({this.ID,this.mycontext});
  @override
  _DetailnotifState createState() => _DetailnotifState();
}

class _DetailnotifState extends State<Detailnotif> {
  bool isloading = false;
  Future getList() async {
    var url = urlWebSite+'api/v1/prescription/${widget.ID}';

    var response = await http.get(url,headers: {'content-type':'application/json','language':'en','Accept':'application/json','Authorization':'Bearer ${General.token}'});
    Map<String,dynamic> cat=jsonDecode(utf8.decode(response.bodyBytes));
    print(cat["data"]);
    return cat["data"];
  }

  @override
  void initState() {

    super.initState();
    getList();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SafeArea(
          child:Stack(
            children: [
              FutureBuilder(
                future: getList(),
                builder: (context, AsyncSnapshot snapshot) {
                  List product=[];

                  if (!snapshot.hasData)
                    return new Container(
                      child: Center(child: new CircularProgressIndicator()),
                    );
                  else {
                    product=snapshot.data["products"];
                    return product!=null?Column(
                      children: [
                        HeaderApp(Title: '${snapshot.data["patient"]}',icon: Icons.arrow_back,c: widget.mycontext,),
                        Container(
                          child: Column(
                          ),
                        ),
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
                                            Text(snapshot.data["pharmacist"],style: TextStyle(
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
                                            Text(snapshot.data["doctor"],style: TextStyle(
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
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey.shade100
                              ),
                              child:ListView.builder(itemCount: product.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                        padding: const EdgeInsets.only(top: 10,bottom: 5),
                                        child: Container(
                                            padding: EdgeInsets.fromLTRB(15, 7, 10, 15),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                color: Colors.grey.shade100
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
                                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                                            color: Colors.white
                                                        ),
                                                        child: Icon(FontAwesomeIcons.bookMedical,size: 40,color: Colors.blue,)),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:15),
                                                      child: Text("${product.asMap()[i]["name"]}",style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18,
                                                          color: Colors.black

                                                      ),),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:15,right: 15),
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.blue
                                                    ),
                                                    child: Center(
                                                      child: Text("${product.asMap()[i]["qty"]}",style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18,
                                                          color: Colors.white
                                                      ),),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                        ));
                                  })

                          ),
                        ),
                        Visibility(
                          visible: snapshot.data["notes"] == null? false:true,
                          child: Container(
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
                                    child: Text('${snapshot.data["notes"] == null?'':snapshot.data["notes"]}',style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey

                                    ),),
                                  ),
                                )
                              ],
                            ),
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
                                    if(snapshot.data["status"] =='Pending'){
                                      setState(() {
                                        isloading = true;
                                      });
                                      Api.CancelPrescription(widget.ID.toString()).then((value) {
                                        if(value == true){
                                          Fluttertoast.showToast(
                                              msg: "Successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                          Navigator.of(widget.mycontext).pop(true);
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
                                          gravity: ToastGravity.BOTTOM,
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
                                  child: Builder(
                                    builder: (context) =>
                                   InkWell(onTap: (){
                                      if(snapshot.data["status"] == 'Pending'){
                                        setState(() {
                                          isloading = true;
                                        });
                                        Api.finishPrescription(widget.ID.toString()).then((value) {
                                          if(value == true){
                                            Fluttertoast.showToast(
                                                msg: "Successfully",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.green,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                         Navigator.of(widget.mycontext).pop(true);
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
                              ),
                            ],
                          ),
                        )
                      ],
                    ):Container();
                  }
                },
              ),
              isloading == true? Loading():Container()
            ],
          ),
        ),
      ),
    );
  }
}
/*

 */
