import 'package:e_comerce/Models/Notif.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'DetailNotifDr.dart';
import 'Detail_Prescription.dart';
import 'Detailnotif.dart';

class NotificationsDr extends StatefulWidget {
  NotificationsDr({this.mycontext});
  BuildContext mycontext;
  @override
  _NotificationsDrState createState() => _NotificationsDrState();
}

class _NotificationsDrState extends State<NotificationsDr> {

  static DatumNotif result= new DatumNotif();
  bool islaoding = false;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        Stack(
          children: [
            result == null? Loading():FutureBuilder(
              future: Api.NotifcationList(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData){
                  return Loading();
                }else{
                  return Padding(
                    padding: const EdgeInsets.only(right: 15,left: 15),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        result = snapshot.data[index];
                        return
                          Padding(
                            padding: const EdgeInsets.only(top:5,left: 8,right: 8),
                            child: InkWell (

                              onTap: () async {
                                bool ok = false;
                                Api.ViewNoti(snapshot.data[index].id).then((value)  {
                               setState(() {
                                 ok = value;
                               });
                                });
                                final reLoadPage = await  Navigator.of(widget.mycontext).push(MaterialPageRoute(builder: (context) => DetailnotifDr(ID: snapshot.data[index].prescriptionId,mycontext: widget.mycontext),));
                                if (ok == true){
                                  if (reLoadPage){
                                    setState(() {
                                      print('readed');
                                    });
                                  }
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: snapshot.data[index].isRead == false? Colors.grey.shade200:Colors.grey.shade50,
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
                                          child: Text(snapshot.data[index].title,style: TextStyle(
                                              fontWeight: snapshot.data[index].isRead == false? FontWeight.bold:null,
                                              fontSize: 18,
                                              color: Colors.black
                                          ),),
                                        ),
                                        Text(snapshot.data[index].date.toString())
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          islaoding = true;
                                        });
                                        print(snapshot.data[index].id);
                                        Api.DeleteNotification(snapshot.data[index].id).then((value) {
                                          setState(() {
                                            print('deleted');
                                            setState(() {
                                              islaoding = false;
                                            });
                                          });
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:8.0),
                                        child: Icon(FontAwesomeIcons.solidTrashAlt,size: 18,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                      },
                    ),
                  );
                }
              },
            ),
            islaoding == true? Loading():Container()
          ],
        ),
      ),);
  }
}
