import 'package:attendancee/models/APIKey.dart';
import 'package:attendancee/models/HttpException.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'dart:async';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;

  Timer _authTimer;

  String get tokenGet {
    return _token;
  }

  String get userIdGet {
    return _userId;
  }

  bool get isAuth {
    if (_token != null)
      return true;
    else
      return false;
  }

  Future<void> authenthicate(String type, String email, String password,
      {String name}) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:$type?key=$APIKey");
    try {
      final response = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true
          }));

  
      if (json.decode(response.body)["error"] != null) {
        throw HttpException(json.decode(response.body)["error"]["message"]);
        
      }

      if (type == "signUp") {
        try {
          final url2 = Uri.parse(
              "https://attendance-manager-b9d3f-default-rtdb.europe-west1.firebasedatabase.app/userData/$_userId.json");
          
          
          // final response2 =
          //     await http.put(url2, body: json.encode({"name": name}));

          // if (response2.statusCode >= 400) {
          //   throw HttpException(response2.statusCode.toString());
          // }
        } catch (e) {
          throw e;
        }
      }

      _token = json.decode(response.body)["idToken"];
      _userId = json.decode(response.body)["localId"];
      _expiryDate = DateTime.now().add(Duration(
          seconds: int.parse(json.decode(response.body)["expiresIn"])));

      // final pref = await SharedPreferences.getInstance();
      // final userData = json.encode({
      //   "email": email,
      //   "password": password,
      //   "token": _token,
      //   "userId": _userId,
      //   "expiryDate": _expiryDate.toIso8601String()
      // });

      //pref.setString("UserData", userData);

      final SecureStorage = FlutterSecureStorage();
      await SecureStorage.write(key: "email", value: email);
      await SecureStorage.write(
          key: "expiryDate", value: _expiryDate.toIso8601String());
      await SecureStorage.write(key: "password", value: password);
      await SecureStorage.write(key: "token", value: _token);
      await SecureStorage.write(key: "userId", value: _userId);

      _autoLogout();

      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
      
    }
  }

  Future<void> login(String email, String password) async{
    await authenthicate("signInWithPassword", email, password);
  }

  Future<void> signup(String email, String password, /*String name*/) async{
    await authenthicate("signUp", email, password,); 
    //name: name);
  }

  Future<bool> autoLogin() async {
    //final pref = await SharedPreferences.getInstance();

    final SecureStorage = FlutterSecureStorage();
    final  SecureData =  SecureStorage.readAll() ;
  

     await SecureData.then((value) {
      if (!value.containsKey("token")) {
        return false;
      }
    });

    // if(!pref.containsKey("UserData"))
    // {
    // }

    // final extractedData = json.decode(pref.getString("UserData"));

    // final expiry = DateTime.parse(extractedData["expiryDate"]);
    // final email = extractedData["email"];
    // final password = extractedData["password"];

    var expiry;
    var email;
    var password;
    var userId;
    var token;

    await SecureData.then((UserData) {
      expiry = DateTime.parse(UserData["expiryDate"]);
      email = UserData["email"];
      password = UserData["password"];
      userId = UserData["userId"];
      token = UserData["token"];
    });

  
    

    if (expiry.isBefore(DateTime.now())) {
      login(email, password);
    } else {
      _expiryDate = expiry;
      _userId = userId; //extractedData["userId"];
      _token = token; //extractedData["token"];
      _autoLogout();
    }

    notifyListeners();

    return true;
  }

  Future<void> logout({bool isAuto=false}) async {
    _token = null;
    _userId = null;
    _expiryDate = null;

    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }

    // final pref = await SharedPreferences.getInstance();
    // pref.clear();
    final SecureStorage = FlutterSecureStorage();

    if(!isAuth)
      SecureStorage.deleteAll();

    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final differenceInSec = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: differenceInSec), (){logout(isAuto: true);});
  }
}
