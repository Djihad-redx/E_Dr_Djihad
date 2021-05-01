import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Models/Doctor.dart';
import 'package:e_comerce/Models/Language.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/InputPasswordFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class UpdateDoctor extends StatefulWidget {
  UpdateDoctor({this.result});
  DataDoctor result;

  @override
  _UpdateDoctorState createState() => _UpdateDoctorState();
}

class _UpdateDoctorState extends State<UpdateDoctor> {
  String status = 'inactive';
  bool rememberMe = false ;
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
  void initState() {

    if (widget.result != null){
      name.text = widget.result.name.toString();
      email.text = widget.result.email.toString();
      mobile.text = widget.result.mobile.toString();

      if(widget.result.status == 'Active'){
        setState(() {
          widget.result.status='active';
          rememberMe = true;
        });

      }else{
        setState(() {
          widget.result.status='inactive';
          rememberMe = false;
        });

      }
    }

    super.initState();
  }
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
                                child: InputFild(Title: 'Phone Number',Border: false,Controler: mobile,)),
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
                          SizedBox(height: 100,),

                          InkWell(
                            onTap: (){
                              setState(() {
                                isloading = true;
                              });
                              Api.UpdateDr(widget.result.id.toString(),name.text.toString(),email.text.toString(),mobile.text.toString(),password1.text.toString(),password1.text.toString(),status).then((value2) {
                                print(value2);
                                setState(() {
                                  isloading = false;
                                });
                                if (value2 == true){
                                  AwesomeDialog(
                                    onDissmissCallback: (){Navigator.of(context).pop(true);},
                                    context: context,
                                    animType: AnimType.SCALE,
                                    dialogType: DialogType.SUCCES,
                                    body: Center(child: Text(
                                      'Doctor has been updated successfully',textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),),
                                  ).show();

                                }else{
                                  AwesomeDialog(
                                    context: context,
                                    animType: AnimType.SCALE,
                                    dialogType: DialogType.ERROR,
                                    body: Center(child: Text(
                                      'Failed',textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),),

                                  ).show();
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left:30,right: 30),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.blue
                              ),
                              child: Center(child: Text('Update',style: TextStyle(
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
