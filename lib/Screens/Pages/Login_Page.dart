import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/InputPasswordFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Helpers/or_divider.dart';
import 'package:e_comerce/Screens/Pages/Admin_Dashboard.dart';
import 'package:e_comerce/Screens/Pages/Dr_DashBoard.dart';
import 'package:e_comerce/Screens/Pages/Forgot_Password_Page.dart';
import 'package:e_comerce/Screens/Pages/Pharmacy_DashBoard.dart';

import 'package:e_comerce/Screens/Pages/SignUpPageDoctor.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  bool isLoading = false;
  TextEditingController Email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  HeaderApp(c: context,Title: "Login"),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(25,00,25,25),
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
                        Image(image: AssetImage('assets/images/dr.png'),height: 200,),
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
                        InputFild(Title: 'Mobile',Controler: Email,isphone: true,),
                        // IntlPhoneField(
                        //   controller: Email,
                        //   decoration: InputDecoration(
                        //     labelText: 'Phone Number',
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide(),
                        //     ),
                        //   ),
                        //   initialCountryCode: 'IN',
                        //   onChanged: (phone) {
                        //     print(phone.completeNumber);
                        //   },
                        // ),
                        InputPasswordFild(Title: 'Password',Controler: Password,),

                        SizedBox(height: 70,),
                        Center(
                          child: InkWell(
                            onTap: (){

                              if (Email.text.isEmpty == false && Password.text.isEmpty == false){
                                setState(() {
                                  isLoading =true;
                                });
                                Api.Login(Email.text.toString(), Password.text.toString()).then((value) {

                                  if(value != null){
                                    if(value.data.role == "Support"){
                                      setState(() {
                                        isLoading =false;
                                      });
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminDashboard(),));
                                    }
                                    else if (value.data.role == "Pharmacist"){
                                      setState(() {
                                        isLoading =false;
                                      });
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PharmacyDashboard(),));
                                    }else if (value.data.role == "Doctor"){
                                      setState(() {
                                        isLoading =false;
                                      });
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DrDashBoard(),));
                                    }else{
                                      setState(() {
                                        isLoading =false;
                                      });
                                    }
                                    setState(() {
                                      isLoading =false;
                                    });
                                  }else{
                                    setState(() {
                                      isLoading =false;
                                    });
                                    Fluttertoast.showToast(
                                        msg: "Account doesnt exist",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }


                                });
                              }else if (Email.text.isEmpty == true){
                                Fluttertoast.showToast(
                                    msg: "Email is empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                              else if (Password.text.isEmpty == true){
                                Fluttertoast.showToast(
                                    msg: "Password empty",
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
                              margin: EdgeInsets.only(left:2,right: 2),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue
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
        ),
      ),
    );
  }
}
