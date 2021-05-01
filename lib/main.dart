import 'dart:convert';

import 'package:e_comerce/Screens/Pages/AccountType_Page.dart';
import 'package:e_comerce/Screens/Pages/Admin_Dashboard.dart';
import 'package:e_comerce/Screens/Pages/Dr_DashBoard.dart';
import 'package:e_comerce/Utlitis/PushNotificationService.dart';

import 'package:e_comerce/traslations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Screens/Pages/Login_Page.dart';
import 'Screens/Pages/Pharmacy_DashBoard.dart';
import 'Utlitis/API_Dr.dart';
import 'Utlitis/General.dart';
import 'Utlitis/globals.dart';
import 'package:http/http.dart' as http;
void setupLocator() {
  GetIt.I.registerLazySingleton(() => PushNotificationService());
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.notification}');
  print('Handling a background message ${message.data}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
   AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar')
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()
    ),
  );
}

class MyApp extends StatefulWidget {
  static List<String> langslist = new List<String>();
  static List<String> Currencylist = new List<String>();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        Navigator.pushNamed(context, '/message',
            );
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(context, '/message',
          );
    });
    General().getUserCurrenc().then((value) {
      General.Currenc = value;
    });
    // General().getUserLang().then((value) {
    //   General.Lang = value;
    // });
    General().getUserToken().then((value) {
      setState(() {
        General.token = value;
        print(value);
      });
    });
    General().getUserType().then((value) {
      setState(() {

        General.Type = value;
        print(value);
      });
    });
  }
  String token = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
       debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SplashScreen(
                seconds: 3,
                navigateAfterSeconds: General.token == ''? LoginPage(): General.Type == "Pharmacist" ?PharmacyDashboard():General.Type == "Support" ?AdminDashboard():General.Type == "Doctor" ?DrDashBoard(): LoginPage(),
                image: Image(image: AssetImage('assets/images/logo.jpg')),
                backgroundColor: Colors.white,
                styleTextUnderTheLoader: new TextStyle(),
                photoSize: 150.0,
                loaderColor: Colors.red)));
  }
}
