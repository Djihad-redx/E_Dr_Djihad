import 'package:e_comerce/Models/Doctor.dart';
import 'package:e_comerce/Models/Presceptionm.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Pages/Update_Doctor.dart';
import 'package:e_comerce/Screens/Pages/Update_Pharm.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'Add_New_Doctor.dart';
import 'Prescription_Farmacy.dart';

class PharmsPage extends StatefulWidget {
  PharmsPage({this.result,this.mycontext});
  Prescreptionm result;
  BuildContext mycontext;
  @override
  _PharmsPageState createState() => _PharmsPageState();
}

class _PharmsPageState extends State<PharmsPage> {
  static Doctor result;
 // static Doctor resultInactive;
  bool isloading = false;
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(widget.mycontext).push(MaterialPageRoute(
            builder: (context) => AddNewDoctor(),
          ));
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
                            indicatorColor: Colors.red,
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
                                          color: Colors.red, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  child: FutureBuilder(
                                    future: Api.getActivePharms(),
                                    builder: (context, AsyncSnapshot<List> snapshot) {
                                      if (!snapshot.hasData){
                                        return Loading();
                                      }else{
                                        return ListView.builder(
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            DataDoctor Activeresult = snapshot.data[index];
                                            return InkWell(
                                              onTap: () async {
                                                final reLoadPage = await Navigator.of(widget.mycontext)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdatePharm(
                                                        result: Activeresult,
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
                                                                Colors.transparent,
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        'assets/images/pharm.png'),
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
                                                                  .52,
                                                              child: Text(
                                                                Activeresult.name
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

                                   Container(
                                        child: FutureBuilder(
                                          future: Api.getInActivePharms(),
                                          builder: (context, AsyncSnapshot<List> snapshot) {
                                            if (!snapshot.hasData){
                                              return Loading();
                                            }else{
                                              return ListView.builder(
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  DataDoctor InActiveresult = snapshot.data[index];
                                                  return InkWell(
                                                    onTap: () async {
                                                      final reLoadPage = await Navigator.of(widget.mycontext)
                                                          .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdatePharm(
                                                              result: InActiveresult,
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
                                                                      Colors.transparent,
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              'assets/images/pharm.png'),
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
                                                                      InActiveresult.name
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

                                                                Api.DeletePharm(
                                                                    InActiveresult.id.toString())
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
