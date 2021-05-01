import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/InputPasswordFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwordfield/passwordfield.dart';

class AddNewDoctor extends StatefulWidget {
  @override
  _AddNewDoctorState createState() => _AddNewDoctorState();
}

class _AddNewDoctorState extends State<AddNewDoctor> {
  String status = "inactive";
  bool rememberMe = false;
  void _onRememberMeChanged(bool newValue) => setState(() {

    rememberMe = newValue;

    if (rememberMe) {
      setState(() {
        status='active';
      });

    } else {
      setState(() {
        status='inactive';
      });
    }
  });
  bool isloading = false;
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController  mobile = new TextEditingController();
  TextEditingController password1 = new TextEditingController();
  TextEditingController password2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  HeaderApp(Title: 'Create a new Patient',icon: Icons.arrow_back,c: context,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:20,right:20),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 10),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: Colors.grey.shade100
                                ),
                                child: InputFild(Title: 'Name',Border: false,Controler: name,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 10),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey.shade100
                                ),
                                child: InputFild(Title: 'Email',Border: false,Controler: email,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 10),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey.shade100
                                ),
                                child: InputFild(Title: 'Phone Number',Border: false,Controler: mobile,isphone: true,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 10),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey.shade100
                                ),
                                child:  PasswordField(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                  controller: password1,
                                  hintText: 'Password',
                                ),
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 10),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: Colors.grey.shade100
                              ),
                              child:  PasswordField(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                controller: password2,
                                hintText: 'Password Confirmation',
                              ),
                            ),
                          ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Checkbox(
                              value: rememberMe,
                              onChanged: _onRememberMeChanged
                          ),
                          Text('Active Account',style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                          SizedBox(height: 30,),

                          InkWell(
                            onTap: (){

                              if (name.text.isEmpty == true){
                                Fluttertoast.showToast(
                                    msg: "Name Filed is empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }else  if (email.text.isEmpty == true){
                                Fluttertoast.showToast(
                                    msg: "Email Filed is empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }else   if (mobile.text.isEmpty == true){
                                Fluttertoast.showToast(
                                    msg: "Phone Number Filed is empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }else   if (password1.text.isEmpty == true){
                                Fluttertoast.showToast(
                                    msg: "Password Filed is empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }else  if (password2.text.isEmpty == true){
                                Fluttertoast.showToast(
                                    msg: "Confirm the password please",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }else{
                                setState(() {
                                  isloading = true;
                                });
                                Api.CreateDoctor(name.text.toString(),email.text.toString(),mobile.text.toString(),password1.text.toString(),password2.text.toString(),status).then((value) {
                                  print(value);
                                  setState(() {
                                    isloading = false;
                                  });
                                  if (value == true){
                                    AwesomeDialog(
                                        context: context,
                                        animType: AnimType.SCALE,
                                        dialogType: DialogType.SUCCES,
                                        body: Center(child: Text(
                                          'Doctor has been created successfully',textAlign: TextAlign.center,
                                          style: TextStyle(),
                                        ),),
                                        onDissmissCallback: (){
                                          Navigator.of(context).pop();
                                        }

                                    ).show();
                                  }else{
                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.SCALE,
                                      dialogType: DialogType.ERROR,
                                      body: Center(child: Text(
                                        'Something went wrong try again',textAlign: TextAlign.center,
                                        style: TextStyle(),
                                      ),),
                                    ).show();
                                  }
                                });
                              }

                            },
                            child: Container(
                              margin: EdgeInsets.only(left:30,right: 30),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.blue
                              ),
                              child: Center(child: Text('Create',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isloading == true? Loading():Container()
            ],
          ),
        ),
      ),
    );
  }
}
