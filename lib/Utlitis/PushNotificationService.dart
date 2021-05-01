
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
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

}






/*class PushNotificationService {


  final FirebaseMessaging _fcm = FirebaseMessaging();
  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
    print("Enter");
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      print(data);
      new PushNotfiy()._showNotificationWithDefaultSound(data['title'],data['Mess']);
      print("call");

    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
      print(notification);
    }

    // Or do other work.
  }

  Future initialise() async {
    print("Start Service");
    print("Start Service11");

    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(
          IosNotificationSettings(sound: true, badge: true, alert: true));
      _fcm.onIosSettingsRegistered
          .listen((IosNotificationSettings settings) {});
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("Enter");
        print("onMessage112: $message");
        print("object1");
        try {
          new PushNotfiy()._showNotificationWithDefaultSound(message['data']['title'],message['data']['Mess']);
        } on Exception catch (exception) {
          throw exception;
        } catch (error) {
        throw error;
        }
        print("object2");

      },
      onBackgroundMessage: Platform.isAndroid ? myBackgroundMessageHandler:null,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }
}
class  PushNotfiy{
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static Future onSelectNot(String playload){
    print("play:"+playload);
  }
  Future _showNotificationWithDefaultSound(title,content) async{
    print("object");
    flutterLocalNotificationsPlugin=new FlutterLocalNotificationsPlugin();
    var android=new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios=new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initSetting=new InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(initSetting,onSelectNotification: onSelectNot);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      content,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }
  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: _scaffoldkey.currentContext,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => SecondScreen(payload),
                ),
              );
            },
          )
        ],
      ),
    );
  }


}*/

