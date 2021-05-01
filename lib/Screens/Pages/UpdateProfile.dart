import 'package:e_comerce/Models/Profile.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Pages/Update_Pharm.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwordfield/passwordfield.dart';

class UpadateProfile extends StatefulWidget {
  UpadateProfile ({this.result,this.pic});
  Profile result;
  String pic;
  @override
  _UpadateProfileState createState() => _UpadateProfileState();
}

class _UpadateProfileState extends State<UpadateProfile> {

  bool isloading = false;

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController  mobile = new TextEditingController();
  TextEditingController password1 = new TextEditingController();
  TextEditingController password2 = new TextEditingController();

  @override
  void initState() {
    if(widget.result != null){
      name.text = widget.result.data.name.toString();
      email.text = widget.result.data.email.toString();
      mobile.text = widget.result.data.mobile.toString();
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
                  HeaderApp(icon: Icons.arrow_back,c: context,Title: 'Edit Profile',),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Container(
                            height: 200,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/${widget.pic}'))
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
                        InkWell(
                          onTap: (){
                            setState(() {
                              isloading = true;
                            });
                            Api.UpdateProfile(name.text.toString(), email.text.toString(), mobile.text.toString(), password1.text.toString()).then((value) {
                                print(value);

                                if(password1.text.isEmpty == true){
                                  Fluttertoast.showToast(
                                      msg: "Password is empty",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                  setState(() {
                                    isloading = false;
                                  });
                                }
                                  if( value == true){
                                    setState(() {
                                      isloading = false;
                                    });
                                    Navigator.of(context).pop(true);
                                  }else{
                                    Fluttertoast.showToast(
                                        msg: "Password incorrect",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );

                                    setState(() {
                                      isloading = false;
                                    });
                                  }

                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left:2,right: 2,top: 30,bottom: 30),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.orange
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
