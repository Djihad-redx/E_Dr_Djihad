import 'package:e_comerce/Screens/Pages/Doctorspage.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Add_New_Doctor.dart';
import 'ProfilePatient.dart';

class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton:  FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewDoctor(),));
            },
            child: const Icon(FontAwesomeIcons.plus),
            backgroundColor: Colors.blue,
          ),
          body:DoctorsPage()

      ),
    );
  }
}
