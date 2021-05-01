import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputFild extends StatelessWidget {
  InputFild({this.Title,this.Border,this.Controler,this.isphone});
  String Title;
  bool Border = true;
  final Controler;
  bool isphone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
    
      padding: EdgeInsets.all(00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      TextField(
        controller: Controler,
        keyboardType: isphone == true ?TextInputType.phone: null,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          hintText: Title,
          border: Border == false? InputBorder.none: null
        ),
      )
        ],
      ),
    );
  }
}
