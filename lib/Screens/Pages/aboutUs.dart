import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUS extends StatefulWidget {
  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            HeaderApp(Title: 'About Us',c: context,icon: Icons.arrow_back,),
            Image(image: AssetImage('assets/images/logo.jpg')),
            SizedBox(height: MediaQuery.of(context).size.height*.3,),
            InkWell(
              onTap: ()async{
                await canLaunch('https://www.google.com/maps?q=24.741947174072266,46.65006637573242&z=17&hl=en') ? await launch('https://www.google.com/maps?q=24.741947174072266,46.65006637573242&z=17&hl=en') : throw 'Could not launch www.google.com';
              },
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.green
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.gps_fixed,color: Colors.white,size: 35,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Our Location',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                      ),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),);
  }
}
