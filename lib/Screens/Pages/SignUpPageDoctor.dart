import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/InputPasswordFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Helpers/or_divider.dart';
import 'package:e_comerce/Screens/Pages/AccountType_Page.dart';
import 'package:e_comerce/Screens/Pages/Login_Page.dart';

import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:e_comerce/Utlitis/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPageDoctor extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPageDoctor> {
  TextEditingController FirstName = new TextEditingController();
  TextEditingController LastName = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController Phone = new TextEditingController();
  TextEditingController Role = new TextEditingController();

  Future<List> AddDoctor()async{
    isLoading=true;
    var url = urlWebSite+'/api/v1/doctor';
    if(FirstName.text.isNotEmpty&&LastName.text.isNotEmpty&&Email.text.isNotEmpty&&Password.text.isNotEmpty){
      var request =  http.MultipartRequest(
          'POST', Uri.parse(url)

      );
      request.headers['language'] ='en';
      request.headers['Content-Type'] ='application/x-www-form-urlencoded';
      request.headers['Accept'] ='application/json';


      request.fields['name'] = '${FirstName.text} ${LastName.text}';
      request.fields['email'] = Email.text;
      request.fields['mobile'] = Phone.text;
      request.fields['password'] = Password.text;
      request.fields['password_confir'] = Password.text;
      request.fields['status'] = 'active';

      try{
        var response = await request.send();
        print('response.stream ${response.stream}');
        print('response.statusCode ${response.statusCode}');
        final res = await http.Response.fromStream(response);
        Map<String,dynamic> dep=jsonDecode(utf8.decode(res.bodyBytes));
        if(dep["message"]=="Seccess"){
          Navigator.pop(context);
        }
      }catch(error){
        print('error ${error}');
      }
      isLoading=false;
    }

  }



  bool isLoading = false;
  bool rememberMe = false;
  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;
    if (rememberMe) {
    } else {
    }
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  HeaderApp(Title: "Create New Account",c: this.context,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,0,25,0),
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Expanded(child: InputFild(Title: "First Name",Controler: FirstName,)),
                              Container(height: 40,width: 5,),
                              Container(height: 40,width: 1,color: Colors.grey,),
                              Container(height: 50,width: 5,),
                              Expanded(child: InputFild(Title: "Last Name",Controler: LastName,)),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15),
                          child: InputFild(Title: 'Phone',Controler: Phone,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15),
                          child: InputFild(Title: 'Email',Controler: Email,),
                        ),

                        InputPasswordFild(Title: 'Password',Controler: Password,),
                        Padding(
                          padding: const EdgeInsets.only(top:12),
                          child: Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.black,
                                  value: rememberMe,
                                  onChanged: (_onRememberMeChanged)
                                         ),
                                  Text('By signing up, you agree to Terms of use',textAlign: TextAlign.start,style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),),
                                ],
                              )),
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                AddDoctor();
                              });


                            },
                            child: Container(
                              margin: EdgeInsets.only(left:2,right: 2),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.red
                              ),
                              child: Center(child: Text('CREATE ACCOUNT',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17
                              ),)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already a member?.',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountType(),));

                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left:4.0),
                                  child: Text('Sign in',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,

                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],),
                    ),
                  ),

                ],),
              isLoading == true ?Loading():Container()
            ],
          ),
        ),


    );
  }
}
