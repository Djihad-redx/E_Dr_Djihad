import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Pages/Detail_Prescription.dart';
import 'package:e_comerce/Screens/Pages/Prescription_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePatient extends StatefulWidget {
  @override
  _ProfilePatientState createState() => _ProfilePatientState();
}
class _ProfilePatientState extends State<ProfilePatient> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton:  FloatingActionButton(
          onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePrescription(),));
          },
          child: const Icon(FontAwesomeIcons.plus),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Column(
            children: [
              HeaderApp(Title: "Profile",icon: Icons.arrow_back,c: context,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.blue,
                ),
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left:5,right: 5),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,40,0,10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:17,left: 10),
                                    child: Text("Profile Name",style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:8.0),
                                          child: Text("Mobile:",style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),),
                                        ),
                                        Text("+9055214765",style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey
                                        ),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:8.0),
                                          child: Text("Email:",style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),),
                                        ),
                                        Text("Test2021@test.com",style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey
                                        ),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:8.0),
                                          child: Text("Adress:",style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),),
                                        ),
                                        Text("Istanbul",style: TextStyle(
                                            fontSize: 14,

                                            color: Colors.grey
                                        ),),
                                      ],
                                    ),
                                  ),

                                ],),
                            ),

                          ],
                        ),
                      ),
                      Positioned(
                          right: 10,
                          top: 5,
                          child: Icon(Icons.edit,size: 30,))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:15,right: 20,left: 20),
                  child: ListView(children: [
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPrescription(),));
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
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPrescription(),));
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
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPrescription(),));
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
                    InkWell(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPrescription(),));
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

                  ],),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
