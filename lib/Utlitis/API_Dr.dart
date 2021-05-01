import 'dart:convert';

import 'package:e_comerce/Models/Doctor.dart';
import 'package:e_comerce/Models/Notif.dart';
import 'package:e_comerce/Models/Presceptionm.dart';
import 'package:e_comerce/Models/Profile.dart';
import 'package:e_comerce/Models/Unreadcount.dart';
import 'package:e_comerce/Models/login.dart';
import 'package:e_comerce/Models/login.dart';
import 'package:e_comerce/Models/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'General.dart';

class Api {
  Api({this.dataOrder});

  final dataOrder;

  static String urlWebSite = "https://pijamma.com/magic/public/";


  static String urlLogin = '${urlWebSite}api/v1/login';
  static String urlgetprescreptions = '${urlWebSite}api/v1/prescription';
  static String urlgetPatientprescreptions =
      '${urlWebSite}api/v1/prescription/patient_index';
  static String urlgetallprescreptions =
      '${urlWebSite}api/v1/prescription';
  static String urlgetPharmaprescreptions =
      '${urlWebSite}api/v1/prescription/pharmacist_index';
  static String urlgetDrprescreptions =
      '${urlWebSite}api/v1/prescription/doctor_index';
  static String urlgetActiveprescreptions = '${urlWebSite}api/v1/prescription';
  static String urlgetInActiveprescreptions =
      '${urlWebSite}api/v1/prescription';
  static String urlcreatdr = '${urlWebSite}api/v1/doctor';
  static String urlcreatPharm = '${urlWebSite}api/v1/pharmacist';
  static String urldeletedr = '${urlWebSite}api/v1/doctor';

  static Future<LoginM> Login(String email, String password) async {
    LoginM res = new LoginM();
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Accept': 'text/plain',
      'Accept': 'application/token'
    };
    var body = {
      'login': email,
      'password': password
    };
    http.Response response =
        await http.post(urlLogin, headers: headers, body: body);

      if (response.statusCode == 200) {

        res = loginFromJson(response.body);
        print(response.body);
        // Token result = tokenFromJson(response.body);
        General().setUserToken(res.data.token.toString());
        General().setUserType(res.data.role.toString());
        FirebaseMessaging.instance.getToken().then((value) async{
          print('Tokkkkken ${value}');
          var url = urlWebSite + 'api/v1/notifications/save-token';
          Map<String, dynamic> body1 = {
            "token": value,
          };
          var bod = jsonEncode(body1);

          // Await the http get response, then decode the json-formatted response.
          var response = await http.post(url, body: bod, headers: {
            'content-type': 'application/json',
            'language': 'en',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${res.data.token.toString()}'
          });
          Map<String, dynamic> cat = jsonDecode(utf8.decode(response.bodyBytes));
          print('Toolkeen ${cat}');
        });
        return res;
      } else {
        print(response.reasonPhrase);
        return null;

    }

  }

  static Future<List<dynamic>> NotifcationList() async{

    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    http.Response response =
    await http.get('https://pijamma.com/magic/public/api/v1/notifications/list', headers: headers,);


String x = response.body;
    if (response.statusCode == 200) {
      Notificationm res = new Notificationm();
      res = notificationFromJson(x);
      print(response.body);
      print('-----------------------------------------------fffffffffffffffffffffff');
      return res.data;
    }
    else {
      print(response.reasonPhrase);
      print('------------aaaaaaaaaa-----------------------------------fffffffffffffffffffffff');

      return null;
    }

  }

  static Future<bool> Logout() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('GET', Uri.parse('$urlWebSite/api/v1/logout'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<List<PrescriptionData>> getAllPrescreptions() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    http.Response response = await http.get(
      urlgetprescreptions,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      var result = Prescreptionm.fromJson(json.decode(response.body));
      print(result);
      return result.data;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<List<PrescriptionData>> getPharPrescreptions() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    http.Response response = await http.get(
      urlgetPharmaprescreptions,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      var result = Prescreptionm.fromJson(json.decode(response.body));
      print(result);
      return result.data;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<Prescreptionm> getPatientPrescreptions() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    http.Response response = await http.get(
      urlgetPatientprescreptions,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      var result = Prescreptionm.fromJson(json.decode(response.body));
      print(result);
      return result;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<Prescreptionm> getPharmaPrescreptions() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    http.Response response = await http.get(
      urlgetPharmaprescreptions,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      var result = Prescreptionm.fromJson(json.decode(response.body));
      print(result);
      return result;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<Prescreptionm> getDrPrescreptions() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    http.Response response = await http.get(
      urlgetDrprescreptions,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      var result = Prescreptionm.fromJson(json.decode(response.body));
      print(result);
      return result;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<Prescreptionm> getActivePrescreptions() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request(
        'GET', Uri.parse('https://pijamma.com/magic/public/api/v1/pharmacist'));
    request.body = '''{\r\n    "status": "active"\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String x = await response.stream.bytesToString();
      var result = Prescreptionm.fromJson(json.decode(x));
      print(result);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<List<DataDoctor>> getActiveDoctors() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request(
        'GET', Uri.parse('https://pijamma.com/magic/public/api/v1/doctor'));
    request.body = '''{\r\n    "status": "active"\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String x = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      var result = doctorFromJson(x);
      print(result);
      return result.data;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<List<DataDoctor>> getInActiveDoctors() async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request(
        'GET', Uri.parse('https://pijamma.com/magic/public/api/v1/doctor'));
    request.body = '''{\r\n    "status": "inactive"\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String x = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      var result = doctorFromJson(x);
      print(result);
      return result.data;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<bool> finishPrescription(String id) async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://pijamma.com/magic/public/api/v1/prescription/$id/finish'));
    request.body = '''''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> CancelPrescription(String id) async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('PUT', Uri.parse('https://pijamma.com/magic/public/api/v1/prescription/$id/cancel'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
  static Future<bool> CreatePharm(String name, String email, String mobile,
      String password1, String password2, String status) async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    var body = {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password1,
      'password_confirmation': password2,
      'status': status
    };

    http.Response response =
    await http.post(urlcreatPharm, headers: headers, body: body);

    if (response.statusCode == 201) {
      print(response.body);
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> CreateDoctor(String name, String email, String mobile,
      String password1, String password2, String status) async {

    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    var body = {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password1,
      'password_confirmation': password2,
      'status': status
    };
    http.Response response =
    await http.post(urlcreatdr, headers: headers, body: body);


  if (response.statusCode == 201) {
    print(response.body);
    return true;
  } else {
    print(response.reasonPhrase);
    return false;
  }

  }

  static Future<Doctor> DeleteDr(String id) async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    http.Response response = await http.delete(
      '${urlWebSite}api/v1/doctor/$id',
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<Doctor> DeleteNotification(String id) async{
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('DELETE', Uri.parse('https://pijamma.com/magic/public/api/v1/notifications/$id/destroy'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  static Future<Doctor> DeletePharm(String id) async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    http.Response response = await http.delete(
      '${urlWebSite}api/v1/pharmacist/$id',
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<bool> UpdateDr(String id, String name, String email,
      String mobile, String password1, String password2, String status) async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    var body = {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password1,
      'password_confirmation': password1,
      'status': status
    };

    http.Response response = await http.put('${urlWebSite}api/v1/doctor/$id',
        headers: headers, body: body);
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }


  static Future<bool> UpdatePharm(String id, String name, String email,
      String mobile, String password1, String password2, String status) async {
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };

    var body = {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password1,
      'password_confirmation': password1,
      'status': status
    };

    http.Response response = await http.put('${urlWebSite}api/v1/pharmacist/$id',
        headers: headers, body: body);
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }


  static Future<List<DataDoctor>> getActivePharms() async{
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('GET', Uri.parse('https://pijamma.com/magic/public/api/v1/pharmacist'));
    request.body = '''{\r\n    "status": "active"\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String x = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      var result = doctorFromJson(x);
      print(result);
      return result.data;
    } else {
      print(response.reasonPhrase);
      return null;
    }

  }

  static Future<List<DataDoctor>> getInActivePharms() async{
    var headers = {
      'language': 'en',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('GET', Uri.parse('https://pijamma.com/magic/public/api/v1/pharmacist'));
    request.body = '''{\r\n    "status": "inactive"\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String x = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      var result = doctorFromJson(x);
      print(result);
      return result.data;
    } else {
      print(response.reasonPhrase);
      return null;
    }

  }



  static Future<Profile> ShowProfile() async{
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('GET', Uri.parse('${urlWebSite}api/v1/user/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String x= await response.stream.bytesToString();

    if (response.statusCode == 200) {
      Profile res = profileFromJson(x);
      print(x);
      print('------------------------------------------------');

      return res;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<bool> UpdateProfile( String name, String email,
      String mobile, String password1) async{
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('PUT', Uri.parse('${urlWebSite}api/v1/user/profile'));
    request.bodyFields = {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password1,
      'password_confirmation': password1
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<List<DataDoctor>> SearchDr(String keyword) async{

    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('POST', Uri.parse('https://pijamma.com/magic/public/api/v1/doctor/search'));
    request.bodyFields = {
      'keyword': keyword
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
   String x = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      Doctor res = doctorFromJson(x);
      print(x);
      return res.data;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<int> NotifcationsUnreaded() async{
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('GET', Uri.parse('https://pijamma.com/magic/public/api/v1/notifications/unread_count'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
String x = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      Countunread res =  countunreadFromJson(x);
      print(x);
      return res.data.count;
    }
    else {
      print(response.reasonPhrase);
      return 0 ;
    }
  }

  static Future<bool> ViewNoti(String id) async{
    var headers = {
      'language': 'en',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('GET', Uri.parse('https://pijamma.com/magic/public/api/v1/notifications/$id/mark-as-read'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
