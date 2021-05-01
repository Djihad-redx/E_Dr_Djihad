import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPaswordPage extends StatefulWidget {
  @override
  _ForgotPaswordPageState createState() => _ForgotPaswordPageState();
}

class _ForgotPaswordPageState extends State<ForgotPaswordPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HeaderApp(c: this.context,Title: 'Forget Password',),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage('assets/images/aa.png'),
                        ),
                      ),
                      SizedBox(height: 60,),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0,left: 5),
                        child: Text('Enter your Email',style: TextStyle(
                          fontSize: 17
                        ),),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade100
                        ),
                        child: InputFild(Title: "EnterEmail",Border: false,),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.2,),
                      Center(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            margin: EdgeInsets.only(left:2,right: 2),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.orange
                            ),
                            child: Center(child: Text('CONTINUE',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
