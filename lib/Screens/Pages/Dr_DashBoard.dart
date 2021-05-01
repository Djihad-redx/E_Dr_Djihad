import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_comerce/Screens/Helpers/DrawerScreen.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Pages/AllProduct.dart';
import 'package:e_comerce/Screens/Pages/Dr_Prescription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'Cart_Page.dart';
import 'HomePage.dart';
import 'CategoryAll.dart';

import 'MyOrder_Page.dart';
import 'Notifications.dart';
import 'NotificationsDr.dart';
class DrDashBoard extends StatefulWidget {
  @override
  _DrDashBoardState createState() => _DrDashBoardState();
}

class _DrDashBoardState extends State<DrDashBoard> {
  String title = 'profile';
  int _currentIndex = 0;
  PageController _pageController;
  void bottomTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  void pageChanged(int index) {

  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              HeaderApp(c: context,Title: title,icon: Icons.menu_sharp,),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: <Widget>[
                    HomePage(),
                    DrPrescriptions(mycontext: context),
                    AllProducts(mycontext: context),
                    NotificationsDr(mycontext: context),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: DrawerScreen(),


        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            setState(() => bottomTapped(index));
            if(index == 0){
              setState(() {
                title = 'Profile';
              });
            }
            if(index == 1){
              setState(() {
                title = 'Prescriptions';
              });
            }
            if(index == 2){
              setState(() {
                title = 'Store';
              });
            }
            if(index == 3){
              setState(() {
                title = 'Notifications';
              });
            }
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.dashboard),
              title: Text('Profile'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.create_new_folder),
              title: Text('Prescriptions',style: TextStyle(fontSize: 13),),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.shop),
              title: Text(
                'Products',
              ),
              activeColor: Colors.pink,
              textAlign: TextAlign.center,
            ),

            BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifications'),
              activeColor: Colors.purple,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
