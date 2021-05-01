import 'package:e_comerce/Models/Doctor.dart';
import 'package:e_comerce/Models/Presceptionm.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Pages/Update_Doctor.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';


import 'Add_New_Doctor.dart';
import 'Prescription_Farmacy.dart';

class DoctorsPage extends StatefulWidget {
  DoctorsPage({this.result});
  Prescreptionm result;
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  static Doctor result;
 // static Doctor resultInactive;
  List<DataDoctor>  Activeresult=[];
  List<DataDoctor>  InActiveresult=[];
  bool isloading = false;
  bool isinsearch = false;
  bool isinsearchInactive = false;
  TextEditingController keyword = new TextEditingController();
  TextEditingController keywordInactive = new TextEditingController();
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final reLoadPage =  await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddNewDoctor(),
          ));
          setState(() {
            print('back');
          });
        },
        child: const Icon(FontAwesomeIcons.plus),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.blue,
                            tabs: [
                              Tab(
                                child: Text(
                                  'Active Accounts',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Inactive Accounts',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.blue, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          isloading = true;
                                        });
                                        if(keyword.text.isEmpty){
                                          setState(() {
                                            isinsearch = false;
                                            isloading = false;
                                          });
                                        }else{
                                          Api.SearchDr(keyword.text.toString()).then((value) {
                                            setState(() {
                                              isinsearch = true;
                                              Activeresult = value;
                                              setState(() {
                                                isloading=false;
                                              });
                                            });
                                          });
                                        }


                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 5),
                                              width: MediaQuery.of(context).size.width*.6,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 10),
                                                    child: Icon(
                                                      FontAwesomeIcons.search,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Flexible(
                                                      child: Padding(
                                                        padding: const EdgeInsets.fromLTRB(12, 0, 8, 8),
                                                        child: TextField(
                                                           controller: keyword,
                                                          decoration: InputDecoration(
                                                              hintText: LocaleKeys.Searche.tr(),
                                                              border: InputBorder.none),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(height: 55,width:MediaQuery.of(context).size.width*.2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                color: Colors.blue,

                                              ),
                                              child: Center(child: Text(LocaleKeys.Searche.tr(),style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                              ),),),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: FutureBuilder(
                                          future: Api.getActiveDoctors(),
                                          builder: (context, AsyncSnapshot<List> snapshot) {
                                            if (!snapshot.hasData ){
                                              return Loading();
                                            }else{
                                              if(isinsearch == false){
                                                  Activeresult = snapshot.data;

                                              }
                                              return ListView.builder(
                                                itemCount: Activeresult.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () async {
                                                      final reLoadPage = await Navigator.of(context)
                                                          .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdateDoctor(
                                                              result: Activeresult[index],
                                                            ),
                                                      ));
                                                      if (reLoadPage){
                                                        setState(() {
                                                          print('back');
                                                        });
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 10),
                                                        padding: EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(0.5),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              offset: Offset(0,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(8)),
                                                          color: Colors.grey.shade100,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  height: 70,
                                                                  width: 70,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color:
                                                                      Colors.blue,
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              'assets/images/dr.png'),
                                                                          fit: BoxFit
                                                                              .cover)),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                                  child: Container(
                                                                    width: MediaQuery.of(
                                                                        context)
                                                                        .size
                                                                        .width *
                                                                        .50,
                                                                    child: Text(
                                                                      Activeresult[index].name
                                                                      ,
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                          18,
                                                                          color: Colors
                                                                              .black),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                padding: EdgeInsets.only(top: 5),
                                              );
                                            }

                                          },

                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Column(
                                     children: [
                                       // InkWell(
                                       //   onTap: (){
                                       //     setState(() {
                                       //       isloading = true;
                                       //     });
                                       //     if(keywordInactive.text.isEmpty){
                                       //       setState(() {
                                       //         isinsearchInactive = false;
                                       //         isloading = false;
                                       //       });
                                       //     }else{
                                       //       Api.SearchDr(keywordInactive.text.toString()).then((value) {
                                       //         setState(() {
                                       //           isinsearchInact-ive = true;
                                       //           InActiveresult = value;
                                       //           setState(() {
                                       //             isloading=false;
                                       //           });
                                       //         });
                                       //       });
                                       //     }
                                       //
                                       //
                                       //   },
                                       //   child: Container(
                                       //     color: Colors.transparent,
                                       //     child: Row(
                                       //       children: [
                                       //         Container(
                                       //           margin: EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 5),
                                       //           width: MediaQuery.of(context).size.width*.6,
                                       //           height: 55,
                                       //           decoration: BoxDecoration(
                                       //               color: Colors.grey.shade100,
                                       //               borderRadius: BorderRadius.all(Radius.circular(8))),
                                       //           child: Row(
                                       //             children: [
                                       //               Padding(
                                       //                 padding: const EdgeInsets.only(left: 8.0, right: 10),
                                       //                 child: Icon(
                                       //                   FontAwesomeIcons.search,
                                       //                   color: Colors.black,
                                       //                 ),
                                       //               ),
                                       //               Flexible(
                                       //                   child: Padding(
                                       //                     padding: const EdgeInsets.fromLTRB(12, 0, 8, 8),
                                       //                     child: TextField(
                                       //                       controller: keywordInactive,
                                       //                       decoration: InputDecoration(
                                       //                           hintText: LocaleKeys.Searche.tr(),
                                       //                           border: InputBorder.none),
                                       //                     ),
                                       //                   ))
                                       //             ],
                                       //           ),
                                       //         ),
                                       //         Container(height: 55,width:MediaQuery.of(context).size.width*.2,
                                       //           decoration: BoxDecoration(
                                       //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                       //             color: Colors.blue,
                                       //
                                       //           ),
                                       //           child: Center(child: Text(LocaleKeys.Searche.tr(),style: TextStyle(
                                       //               fontWeight: FontWeight.bold,
                                       //               color: Colors.white
                                       //           ),),),
                                       //         )
                                       //       ],
                                       //     ),
                                       //   ),
                                       // ),
                                       Expanded(

                                         child: Container(
                                              child: FutureBuilder(
                                                future: Api.getInActiveDoctors(),
                                                builder: (context, AsyncSnapshot<List> snapshot) {
                                                  if (!snapshot.hasData ){
                                                    return Loading();
                                                  }else{
                                                    if(isinsearchInactive == false){
                                                      InActiveresult = snapshot.data;

                                                    }
                                                    return ListView.builder(
                                                      itemCount: InActiveresult.length,
                                                      itemBuilder: (context, index) {

                                                        return InkWell(
                                                          onTap: () async {
                                                            final reLoadPage = await Navigator.of(context)
                                                                .push(MaterialPageRoute(
                                                              builder: (context) =>
                                                                  UpdateDoctor(
                                                                    result: InActiveresult[index],
                                                                  ),
                                                            ));
                                                            if (reLoadPage){
                                                              setState(() {
                                                                print('back');
                                                              });
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets.all(8.0),
                                                            child: Container(
                                                              margin: EdgeInsets.only(
                                                                  bottom: 10),
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.grey
                                                                        .withOpacity(0.5),
                                                                    spreadRadius: 5,
                                                                    blurRadius: 7,
                                                                    offset: Offset(0,
                                                                        3), // changes position of shadow
                                                                  ),
                                                                ],
                                                                borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(8)),
                                                                color: Colors.grey.shade100,
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height: 70,
                                                                        width: 70,
                                                                        decoration: BoxDecoration(
                                                                            shape: BoxShape
                                                                                .circle,
                                                                            color:
                                                                            Colors.blue,
                                                                            image: DecorationImage(
                                                                                image: AssetImage(
                                                                                    'assets/images/dr.png'),
                                                                                fit: BoxFit
                                                                                    .cover)),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                        const EdgeInsets
                                                                            .all(8.0),
                                                                        child: Container(
                                                                          width: MediaQuery.of(
                                                                              context)
                                                                              .size
                                                                              .width *
                                                                              .50,
                                                                          child: Text(
                                                                            InActiveresult[index].name
                                                                                ,
                                                                            style: TextStyle(
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize:
                                                                                18,
                                                                                color: Colors
                                                                                    .black),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      setState(() {
                                                                        isloading = true;
                                                                      });

                                                                      Api.DeleteDr(
                                                                          InActiveresult[index].id.toString())
                                                                          .then((value) {
                                                                            setState(() {
                                                                              isloading = false;
                                                                            });
                                                                      });
                                                                    },
                                                                    child: Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          right: 8.0),
                                                                      child: Icon(
                                                                        Icons.delete_sharp,
                                                                        size: 25,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      padding: EdgeInsets.only(top: 5),
                                                    );
                                                  }

                                                },

                                              ),
                                            ),
                                       ),
                                     ],
                                   ),
                              ])),
                        )
                      ])),
            ),
          ),
          isloading == true ? Loading() : Container()
        ],
      ),
    );
  }
}
