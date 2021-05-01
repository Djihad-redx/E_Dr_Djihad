import 'package:e_comerce/Screens/Pages/Add_New_pharm.dart';
import 'package:e_comerce/Screens/Pages/Doctorspage.dart';
import 'package:e_comerce/Screens/Pages/Pharmspage.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Add_New_Doctor.dart';
import 'ProfilePatient.dart';

class Pharms extends StatefulWidget {
  Pharms({this.mycontext});
  BuildContext mycontext;
  @override
  _PharmsState createState() => _PharmsState();
}

class _PharmsState extends State<Pharms> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton:  FloatingActionButton(
            onPressed: () async {
              final reLoadPage =  await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddNewPharm(),
              ));
              setState(() {
                print('back');
              });
            },
            child: const Icon(FontAwesomeIcons.plus),
            backgroundColor: Colors.red,
          ),
          body:PharmsPage(mycontext: context,)

      ),
    );
  }
}
