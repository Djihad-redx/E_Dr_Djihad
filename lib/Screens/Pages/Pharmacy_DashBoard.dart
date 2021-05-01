import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_comerce/Models/Presceptionm.dart';
import 'package:e_comerce/Screens/Helpers/DrawerScreen.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Pages/HomePagePharmacy.dart';
import 'package:e_comerce/Screens/Pages/Notifications.dart';
import 'package:e_comerce/Screens/Pages/pharPrescriptions.dart';
import 'package:e_comerce/Utlitis/API_Dr.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AllProduct.dart';
import 'CategoryAll.dart';


class PharmacyDashboard extends StatefulWidget {

  @override
  PharmacyDashboardState createState() => PharmacyDashboardState();
}

class PharmacyDashboardState extends State<PharmacyDashboard> {
  refresh() {
    setState(() {});
  }
  int counter = 0;
  int _currentIndex = 0;
  PageController _pageController;
  String title = 'Profile';
  void bottomTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }


 List<PrescriptionData>  resultPrescreptionPhar = [] ;
  @override
  void initState() {

    Api.NotifcationsUnreaded().then((value) {
      setState(() {
        counter = value;
      });

    });

    Api.getPharPrescreptions().then((value) {
      setState(() {
        resultPrescreptionPhar = value;
      });

    });

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
      // supportedLocales: context.supportedLocales,
      // localizationsDelegates: context.localizationDelegates,
      // locale: context.locale,
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
                    HomePagePharmacy(),
                    PharmacyPrescreption(result: resultPrescreptionPhar,mycontext: this.context,),
                    AllProducts(),
                    Notifications(mycontext: context),
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
          itemCornerRadius: 10,
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
              title: Text('Prescriptions'),
              activeColor: Colors.purple,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.shop),
              title: Text('Products'),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.notifications),
                  // Container(
                  //   height: 15,
                  //   width: 15,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.deepOrange
                  //   ),
                  //   child: Center(
                  //     child: Text(counter.toString(),style: TextStyle(
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white
                  //     ),),
                  //   ),
                  // )

                ],
              ),
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
