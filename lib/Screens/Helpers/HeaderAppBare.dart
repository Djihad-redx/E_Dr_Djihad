import 'package:e_comerce/Screens/Pages/Cart_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderApp extends StatefulWidget {
  HeaderApp({this.Title,this.c,this.icon,this.iconcart});
  String Title;
  final BuildContext c;
  IconData icon;
  IconData iconcart;
  @override
  _HeaderAppState createState() => _HeaderAppState();
}

class _HeaderAppState extends State<HeaderApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: (){
                    widget.icon == Icons.arrow_back || widget.icon == Icons.menu_open_sharp? Navigator.pop(widget.c, true):
                    Scaffold.of(context).openDrawer();
                    },
                    child: Icon(widget.icon,size: 35,)),
              ),
              Expanded(
                child: Center(
                  child: Text(widget.Title,style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),textAlign: TextAlign.center,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage(),));
                    },
                    child: Icon(widget.iconcart,size: 35,)),
              ),
            ],
          ),
        ),
        Container(
            width: double.infinity,
            child: Divider())
      ],
    ),

    );
  }
}
