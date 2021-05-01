import 'dart:convert';

import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:e_comerce/Utlitis/globals.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Detail_Prescription.dart';
import 'DetaillPrescriptionDr.dart';
import 'Prescription_Farmacy.dart';
import 'Prescription_Page.dart';
import 'package:http/http.dart' as http;

class DrPrescriptions extends StatefulWidget {
  DrPrescriptions ({this.mycontext});
  BuildContext mycontext;
  @override
  _DrPrescriptionsState createState() => _DrPrescriptionsState();
}

class _DrPrescriptionsState extends State<DrPrescriptions> {
  Future<List> getList() async {
    var url = urlWebSite + 'api/v1/prescription/doctor_index';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {
      'content-type': 'application/json',
      'language': 'en',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    });
    Map<String, dynamic> cat = jsonDecode(utf8.decode(response.bodyBytes));
    return cat["data"];
  }

  @override
  Widget build(BuildContext contextt) {
    BuildContext mycontext;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePrescription(),));
            final reLoadPage = await Navigator.of(widget.mycontext).push(
                MaterialPageRoute(builder: (context) => CreatePrescription()));
            if (reLoadPage) {
              setState(() {
                getList();
              });
            }
          },
          child: const Icon(FontAwesomeIcons.plus),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
          child: FutureBuilder(
            future: getList(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              print('Date ${snapshot.hasData}');
              if (!snapshot.hasData)
                return new Container(
                  child: Center(child: new CircularProgressIndicator()),
                );
              else
                return Container(
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () async {
                          final reLoadPage = await Navigator.of(widget.mycontext)
                              .push(MaterialPageRoute(
                            builder: (context) => DetailPrescriptionDr(
                               ID: snapshot.data.asMap()[i]["id"] ,mycontext: context,),
                          ));
                          if (reLoadPage) {
                            setState(() {
                              print("Back");
                            });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20,left: 2,right: 2),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                            color:  snapshot.data.asMap()[i]["status"] == "Pending"? Colors.blue.shade100: snapshot.data.asMap()[i]["status"] == "Canceled"?Colors.red.shade100 : snapshot.data.asMap()[i]["status"] == 'Finished'?Colors.green.shade100:Colors.grey.shade100,
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${snapshot.data.asMap()[i]["patient"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    '${snapshot.data.asMap()[i]["status"]}',style: TextStyle(
                                     color: snapshot.data.asMap()[i]["status"] == "Pending"? Colors.blue: snapshot.data.asMap()[i]["status"] == "Canceled"?Colors.red : snapshot.data.asMap()[i]["status"] == 'Finished'?Colors.green:null,
                                  ),)
                                ],
                              ),
                              // InkWell(
                              //   onTap: () {},
                              //   child: Padding(
                              //     padding:
                              //         const EdgeInsets.only(right: 8.0),
                              //     child: Icon(
                              //       FontAwesomeIcons.solidTrashAlt,
                              //       size: 22,
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
            },
          ),
        ),
      ),
    );
  }
}
/*
InkWell(

                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPrescription(),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.grey.shade100,
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Title",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black
                                ),),
                              ),
                              Text('21/05/2020')
                            ],
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Icon(FontAwesomeIcons.solidTrashAlt,size: 22,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
 */
