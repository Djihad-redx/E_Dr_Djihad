import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Pages/Login_Page.dart';
import 'package:e_comerce/Screens/Pages/aboutUs.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../main.dart';
import 'Loading.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isLoading = false;
  bool _enable = false;
  @override
  Widget build(BuildContext context) {
    String dropdownNames;
    String dropdownNames2;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                HeaderApp(c: context,Title: LocaleKeys.Settings.tr(),icon: Icons.menu_open_sharp,),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                         margin: EdgeInsets.fromLTRB(20,20,20,20),
                       decoration: BoxDecoration(
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.3),
                               spreadRadius: 5,
                               blurRadius: 7,
                               offset: Offset(0, 3), // changes position of shadow
                             ),
                           ],
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         color: Colors.white
                       ),
                        child: ListView(
                          padding: EdgeInsets.all(25),
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 30),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.Notifications.tr(),style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  CupertinoSwitch(
                                    activeColor: Colors.red,
                                    value: _enable,
                                    onChanged: (value) {
                                      setState(() {
                                        _enable = value;
                                      });
                                    },
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.Lang.tr(),style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                  Container(
                                    padding: EdgeInsets.only(left:5,right: 5),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(1, 1), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        color: Colors.white
                                    ),
                                    child: DropdownButton<String>(
                                      underline: Container(),
                                      hint: Container(
                                          width: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right:8.0),
                                            child: Text('English',style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                            ),),
                                          )),
                                      value: dropdownNames,
                                      onChanged: (String newValue) {
                                        setState(() async{
                                          dropdownNames = newValue;
                                          // General().setUserLang(newValue);
                                          if(newValue == "Arabic"){
                                            await context.setLocale(Locale('en'));
                                          }else{
                                            await context.setLocale(Locale('en'));

                                          }
                                        });
                                      },
                                      items: ['English']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(margin: EdgeInsets.only(left: 4,right: 4),child: Text(value,style:TextStyle(fontSize: 14,color: Colors.blueGrey))),
                                        );
                                      }).toList(),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(LocaleKeys.Currency.tr(),style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                  Container(
                                    padding: EdgeInsets.only(left:5,right: 5),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(1, 1), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        color: Colors.white
                                    ),
                                    child: DropdownButton<String>(
                                      underline: Container(),
                                      hint: Container(
                                          width: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right:8.0),
                                            child: Text('SAR',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                            ),),
                                          )),
                                      value: dropdownNames2,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownNames2 = newValue;
                                          General().setUserCurrenc(newValue);
                                        });
                                      },
                                      items: ['SAR']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(margin: EdgeInsets.only(left: 4,right: 4),child: Text(value,style:TextStyle(fontSize: 14,color: Colors.blueGrey))),
                                        );
                                      }).toList(),
                                    ),
                                  ),

                                ],
                              ),
                            ),



                            Padding(
                              padding: const EdgeInsets.only(top:20,bottom: 20),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUS(),));
                                },
                                child: Text(LocaleKeys.About.tr(),style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),),
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                setState(() {
                                  isLoading =true;
                                });
                                General().setUserToken('');
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*.3,top: 20),
                                height: 60,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(1, 1), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.red
                                ),
                                child: Center(child: Row(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:15,right: 15),
                                      child: Icon(FontAwesomeIcons.signOutAlt,size: 35,color: Colors.white,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right:30.0),
                                      child: Text('Sign-out',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white
                                      ),),
                                    ),
                                   ],
                                )),
                              ),
                            )

                          ],
                        )
                      ),
                      isLoading == true ?Loading():Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
