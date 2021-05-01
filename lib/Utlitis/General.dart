import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class General {

  static String token = "";
  static String Type = "";
 // static String Lang = "";
  static String Currenc = "";




  Future<String> getUserToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token") ?? "";
    return token;
  }

  void setUserToken(String tokenSet) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = tokenSet;
    pref.setString("token", tokenSet);
  }
  Future<String> getUserType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Type = pref.getString("Type") ?? "";
    return Type;
  }

  void setUserType(String TypeSet) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Type = TypeSet;
    pref.setString("Type", TypeSet);
  }

  // Future<String> getUserLang() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   Lang = pref.getString("Lang") ?? "";
  //   return Lang;
  // }
  //
  // void setUserLang(String LangSet) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   Lang = LangSet;
  //   pref.setString("Lang", LangSet);
  // }

  Future<String> getUserCurrenc() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Currenc = pref.getString("Currenc") ?? "";
    return Currenc;
  }

  void setUserCurrenc(String CurrencSet) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Currenc = CurrencSet;
    pref.setString("Currenc", CurrencSet);
  }
  // checkConnection(BuildContext context) async{
  //   listener = DataConnectionChecker().onStatusChange.listen((status) {
  //     switch (status){
  //       case DataConnectionStatus.connected:
  //         InternetStatus = "Connected to the Internet";
  //         contentmessage = "Connected to the Internet";
  //         _showDialog(InternetStatus,contentmessage,context);
  //         break;
  //       case DataConnectionStatus.disconnected:
  //         InternetStatus = "You are disconnected to the Internet. ";
  //         contentmessage = "Please check your internet connection";
  //         _showDialog(InternetStatus,contentmessage,context);
  //         break;
  //     }
  //   });
  //   return await DataConnectionChecker().connectionStatus;
  // }

}