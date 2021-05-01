import 'dart:convert';

import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:e_comerce/Utlitis/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class CreatePrescription extends StatefulWidget {
  @override
  _CreatePrescriptionState createState() => _CreatePrescriptionState();
}

class _CreatePrescriptionState extends State<CreatePrescription> {
  TextEditingController NameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController NoteController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Prescription> Item = [];
  List<Prescription> ItemRemov = [];
  bool Find = false;
  int pharmacyId = 0;
  static String PharmacyName;
  Future<List> getCatogery() async {
    // Initialize the API
    var url = urlWebSite + 'api/v1/ten_products';
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

  Future<List> getPharmacy() async {
    // Initialize the API
    var url = urlWebSite+'api/v1/pharmacist';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url,headers: {'content-type':'application/json','language':'en','Accept':'application/json','Authorization':'Bearer ${General.token}'});
    Map<String,dynamic> cat=jsonDecode(utf8.decode(response.bodyBytes));
    List data=cat["data"];
    data=data.where((element)=>
    element["status"]=="Active"
    ).toList();
    print(data.toList());
    return data;
  }

  Future<List<Prescription>> getItem() async {
    return Item;
  }

  Future AddProducts() async {
    List<Map<String, dynamic>> ItemProd = [];

    if (NameController.text.isEmpty == true){
      Fluttertoast.showToast(
          msg: "Name Filed is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else  if (PhoneController.text.isEmpty == true){
      Fluttertoast.showToast(
          msg: "Phone Number Filed is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
   else if (Item.isNotEmpty) {
      Item.forEach((element) {
        ItemProd.add({'product_id': element.id, 'qty': element.qyt});
      });
      print(ItemProd);
      var url = urlWebSite + 'api/v1/prescription/auto_create_patient';
      Map<String, dynamic> body1 = {
        "pharmacist_id": pharmacyId,
        "patient_name": NameController.text,
        "patient_mobile": PhoneController.text,
        "notes": NoteController.text,
        "products": ItemProd
      };
      var bod = jsonEncode(body1);

      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(url, body: bod, headers: {
        'content-type': 'application/json',
        'language': 'en',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${General.token}'
      });
      Map<String, dynamic> cat = jsonDecode(utf8.decode(response.bodyBytes));
      print(cat);
      if (cat["success"]) {
        final snackBar = SnackBar(
          content: Text('Prescription added'),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        Navigator.of(context).pop(true);
      } else {
        final snackBar = SnackBar(
          content: Text('There is an error when processing the Prescription'),
          action: SnackBarAction(),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    }else {
      Fluttertoast.showToast(
          msg: "Something went wrong try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    var sheight = MediaQuery.of(context).size.height;
    var swidth = MediaQuery.of(context).size.height;
    final snackbae = SnackBar(
      backgroundColor: Colors.white,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(swidth * 0.05)),
      content: Container(
        height: sheight * 0.7,
        width: swidth,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 70,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue),
            ),
            FutureBuilder(
              future: getCatogery(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData)
                  return new Container(
                    child: Center(child: new CircularProgressIndicator()),
                  );
                else
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(15, 7, 10, 7),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey.shade100),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          "${snapshot.data[i]["name"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Item.forEach((element) {
                                                    print(element);
                                                    if (element.id ==
                                                        snapshot.data[i]
                                                        ["id"]) {
                                                      if (element.qyt > 1) {
                                                        element.qyt--;
                                                      }
                                                      if (element.qyt == 1) {
                                                        ItemRemov.add(
                                                            element);
                                                      }

                                                      Find = true;
                                                    }
                                                  });
                                                  Fluttertoast.showToast(
                                                      msg: "Remove",
                                                      toastLength:
                                                      Toast.LENGTH_SHORT,
                                                      gravity:
                                                      ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                      Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                  Item.removeWhere(
                                                          (element) =>
                                                          ItemRemov.contains(
                                                              element));
                                                  ItemRemov = [];
                                                  Find = false;
                                                  getItem();
                                                });
                                              },
                                              child:Container(
                                                  height: 60,
                                                  width: 55,
                                                  padding: EdgeInsets.all(0),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                      color: Colors.red),
                                                  child: Center(
                                                    child: Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: 25,
                                                          color: Colors.white),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Item.forEach((element) {
                                                    if (element.id ==
                                                        snapshot.data[i]["id"]) {
                                                      element.qyt++;
                                                      Find = true;
                                                    }
                                                  });
                                                  if (!Find) {
                                                    Item.add(new Prescription(
                                                        snapshot.data[i]["name"],
                                                        1,
                                                        snapshot.data[i]["id"]));
                                                  }
                                                  Fluttertoast.showToast(
                                                      msg: "Add",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 0,
                                                      backgroundColor: Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                  Find = false;
                                                  getItem();
                                                });
                                              },
                                              child: Container(
                                                  height: 60,
                                                  width: 55,
                                                  padding: EdgeInsets.all(0),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                      color: Colors.green),
                                                  child: Center(
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 25,
                                                          color: Colors.white),
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
      duration: Duration(days: 365),
    );

    final snackParmace = SnackBar(
      backgroundColor: Colors.white,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(swidth * 0.05)),
      content: Container(
        height: sheight * 0.6,
        width: swidth,
        child: FutureBuilder(
          future: getPharmacy(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData)
              return new Container(
                child: Center(child: new CircularProgressIndicator()),
              );
            else
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8,0,8,8),
                    height:5,width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.red
                  ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                pharmacyId = snapshot.data[i]["id"];
                                setState(() {
                                  PharmacyName = snapshot.data[i]["name"];
                                });
                                _scaffoldKey.currentState
                                    .hideCurrentSnackBar();
                              });
                            },
                            child: Container(
                              height: 60,
                                padding: EdgeInsets.fromLTRB(15, 7, 10, 15),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey.shade100),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "${snapshot.data[i]["name"]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
          },
        ),
      ),
      duration: Duration(days: 365),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  HeaderApp(
                    c: context,
                    icon: Icons.arrow_back,
                    Title: "Create new Prescription",
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 0),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey.shade100),
                                child: InputFild(
                                  Title: 'Name',
                                  Border: false,
                                  Controler: NameController,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 0),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey.shade100),
                                child: InputFild(
                                  isphone: true,
                                  Title: 'Phone Number',
                                  Border: false,
                                  Controler: PhoneController,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState
                                  .showSnackBar(snackParmace);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              child: Container(
                                  height: 60,
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.red),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: Colors.white),
                                              child: Icon(
                                                FontAwesomeIcons.plus,
                                                size: 25,
                                                color: Colors.red,
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              pharmacyId == 0
                                                  ? "Choose pharmacist"
                                                  : PharmacyName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState.showSnackBar(snackbae);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              child: Container(
                                  height: 60,
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.blue),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: Colors.white),
                                              child: Icon(
                                                FontAwesomeIcons.plus,
                                                size: 25,
                                                color: Colors.blue,
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "Add new Medicine",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .25,
                            child: FutureBuilder(
                              future: getItem(),
                              builder: (context,
                                  AsyncSnapshot<List<Prescription>> snapshot) {
                                if (!snapshot.hasData)
                                  return new Container(
                                    child: Center(
                                        child: new CircularProgressIndicator()),
                                  );
                                else
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    child: ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 5),
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 7, 10, 15),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  color: Colors.grey.shade100),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                              color:
                                                                  Colors.white),
                                                          child: Icon(
                                                            FontAwesomeIcons
                                                                .bookMedical,
                                                            size: 40,
                                                            color: Colors.blue,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 15),
                                                        child: Text(
                                                          "${snapshot.data[i].Name}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.blue),
                                                      child: Center(
                                                        child: Text(
                                                          "${snapshot.data[i].qyt}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        );
                                      },
                                    ),
                                  );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey.shade100),
                                child: InputFild(
                                  Title: 'Note',
                                  Border: false,
                                  Controler: NoteController,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isloading = true;
                              });
                              AddProducts().then((value) {
                                setState(() {
                                  isloading = false;
                                });
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 30, right: 30, bottom: 15),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.blue),
                              child: Center(
                                  child: Text(
                                'Create',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isloading == true ? Loading() : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class Prescription {
  String Name;
  int id, qyt;
  Prescription(this.Name, this.qyt, this.id);
}

class Prod {
  int product_id, qty;
  Prod(this.product_id, this.qty);
}
