import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class InputPasswordFild extends StatelessWidget {
  InputPasswordFild({this.Title,this.Controler});
  String Title;
  TextEditingController Controler;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PasswordField(
            hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            controller: Controler,
            hintText: Title,
      ),
        ],
      ),
      padding: EdgeInsets.only(top:15),
    );
  }
}
