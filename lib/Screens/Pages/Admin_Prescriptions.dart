import 'package:e_comerce/Models/Currency.dart';
import 'package:e_comerce/Models/Presceptionm.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Detail_Prescription.dart';

class AdminPrescriptions extends StatefulWidget {
  AdminPrescriptions({this.mycontext});
  BuildContext mycontext;

  @override
  _AdminPrescriptionsState createState() => _AdminPrescriptionsState();
}

class _AdminPrescriptionsState extends State<AdminPrescriptions> {
  PrescriptionData res=new PrescriptionData();
  bool isloading =false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: Scaffold(
        body: res == null? Loading():FutureBuilder(
          future: Api.getAllPrescreptions(),
          builder: (context, AsyncSnapshot<List> snapshot) {

            if (!snapshot.hasData){
              return Loading();
            }else{
              return res != null? Padding(
                padding: const EdgeInsets.only(right: 0,left: 0),
                child: ListView.builder(

                  padding: EdgeInsets.all(15),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    res = snapshot.data[i];
                    return InkWell(
                      onTap: () async {
                        final reLoadPage = await Navigator.of(widget.mycontext)
                            .push(MaterialPageRoute(
                          builder: (context) => DetailPrescription(
                              ID: snapshot.data[i].id,mycontext: widget.mycontext,),
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
                              spreadRadius: 7,
                              blurRadius: 5,
                              offset: Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          color: Colors.grey.shade100,
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
                                    snapshot.data[i].doctor,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                                Text(
                                    snapshot.data[i].status)
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
              ):Container();
            }

          },
        ),
      ),
    );
  }
}
