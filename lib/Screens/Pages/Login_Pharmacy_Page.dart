import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/InputPasswordFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Helpers/or_divider.dart';
import 'package:e_comerce/Screens/Pages/Forgot_Password_Page.dart';

import 'package:e_comerce/Screens/Pages/Pharmacy_DashBoard.dart';
import 'package:e_comerce/Screens/Pages/SignUpPageDoctor.dart';
import 'package:e_comerce/Screens/Pages/SignUpPagePahrmace.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPharmacyPage extends StatefulWidget {
  @override
  _LoginPharmacyPageState createState() => _LoginPharmacyPageState();
}

class _LoginPharmacyPageState extends State<LoginPharmacyPage> {
  bool isLoading = false;
  TextEditingController Email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body:  SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  HeaderApp(c: context,Title: "Pharmacy Login",icon: Icons.arrow_back),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(25,00,25,25),
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
                        Image(image: AssetImage('assets/images/phar.png'),height: 200,),
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text('Login',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.black
                            ),),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.05,),
                        InputFild(Title: 'EMAIL',Controler: Email,),
                        InputPasswordFild(Title: 'Password',Controler: Password,),
                        SizedBox(height: 70,),
                        Center(
                          child: InkWell(
                            onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PharmacyDashboard()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left:2,right: 2),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.red
                              ),
                              child: Center(child: Text('LOGIN',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),)),
                            ),
                          ),
                        ),

                        SizedBox(height: 30,),

                      ],),
                  ),
                ],
              ),
              isLoading == true ?Loading():Container()
            ],
          ),
        )
      ),
    );
  }
}
