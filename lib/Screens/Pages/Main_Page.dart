import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_comerce/Screens/Helpers/DrawerScreen.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Pages/Cart_Page.dart';
import 'package:e_comerce/Screens/Pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'MyOrder_Page.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
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
              HeaderApp(c: context,Title: "MainPage",icon: Icons.menu_sharp,),
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
                      HomePage(),
                      MyOrderPage()
                    ],
                  ),
              ),
            ],
          ),
        ),
        drawer: DrawerScreen(),
      ),
    );
  }
}
