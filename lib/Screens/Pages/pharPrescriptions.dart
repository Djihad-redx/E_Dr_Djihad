import 'package:e_comerce/Models/Presceptionm.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Prescription_Farmacy.dart';

// ignore: must_be_immutable
class PharmacyPrescreption extends StatefulWidget {

  PharmacyPrescreption({this.result,this.mycontext});
  BuildContext mycontext;
  List<PrescriptionData> result ;
  @override
  _PharmacyPrescreptionState createState() => _PharmacyPrescreptionState();
}

class _PharmacyPrescreptionState extends State<PharmacyPrescreption> {
   int count = 0;
  List<PrescriptionData> resultPending =[];
  List<PrescriptionData> resultothers =[];
  List<PrescriptionData> resultPrescreptionPhar =[];
  @override
  void initState() {
Api.NotifcationsUnreaded().then((value) {
  count = value;
});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20,right: 20),
      child: DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
            Container(
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8),
                        child: Text('New '),
                      ),
                      // Container(
                      //   height: 20,
                      //   width: 20,
                      //   decoration: BoxDecoration(
                      //   shape: BoxShape.circle,
                      //   color: Colors.red
                      // ),
                      //   child: Center(
                      //     child: Text('5',style: TextStyle(
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white
                      //     ),),
                      //   ),
                      // )

                    ],
                  ),

                  ),
                  Tab(text: 'History'),


                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Colors.red, width: 0.5))
                  ),
                  child: TabBarView(children: <Widget>[

                    Column(
                      children: [
                        Expanded(
                          child:  resultothers == null?Loading(): Padding(
                            padding: EdgeInsets.only(top:5,right: 0,left: 0),
                            child: FutureBuilder(
                                future: Api.getPharPrescreptions(),
                                builder: (context,AsyncSnapshot<List>  snapshot) {
                                  resultothers = [];
                                  if (!snapshot.hasData ){
                                    return Loading();
                                  }else{
                                    for(var item in snapshot.data){
                                      if (item.status == "Pending"){
                                        resultothers.add(item);
                                      }
                                    }
                                    return  ListView.builder(
                                      itemCount: resultothers.length,
                                      itemBuilder: (context, index) {
                                        return  Padding(
                                          padding: EdgeInsets.only(top:5,left: 8,right: 8),
                                          child: InkWell(
                                            onTap: ()
                                            async {
                                              final reLoadPage = await Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    PrescriptionFarmacycheack(result: resultothers[index]),
                                              ));
                                              if (reLoadPage){
                                                setState(() {
                                                  print('back');
                                                });
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
                                                        child: Text(resultothers[index].doctor,style: TextStyle(
                                                            fontWeight:FontWeight.bold,
                                                            fontSize: 18,
                                                            color: Colors.black
                                                        ),),
                                                      ),
                                                      Text(resultothers[index].status)
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },);
                                  }}


                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                     Expanded(
                          child:   resultothers == null?Loading(): Padding(
                            padding: EdgeInsets.only(top:5,right: 0,left: 0),
                            child: FutureBuilder(
                              future: Api.getPharPrescreptions(),
                              builder: (context,AsyncSnapshot<List>  snapshot) {
                                resultothers = [];

                                if (!snapshot.hasData ){
                                return Loading();
                                }else{
                                  for(var item in snapshot.data){
                                    if (item.status != "Pending"){

                                       resultothers.add(item);

                                    }
                                  }
                                return  ListView.builder(
                                  itemCount: resultothers.length,
                                  itemBuilder: (context, index) {
                                    return  Padding(
                                      padding: EdgeInsets.only(top:5,left: 8,right: 8),
                                      child: InkWell(
                                        onTap: ()  async {
                                          final reLoadPage = await Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                PrescriptionFarmacycheack(result: resultothers[index]),
                                          ));
                                          if (reLoadPage){
                                            setState(() {
                                              print('back');
                                            });
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
                                                    child: Text(resultothers[index].doctor,style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.black
                                                    ),),
                                                  ),
                                                  Text(resultothers[index].status)
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },);
                              }}


                            ),
                          ),
                        ),
                      ],
                    ),

                  ])
              ),
            )
          ])
      ),
    );
  }
}
