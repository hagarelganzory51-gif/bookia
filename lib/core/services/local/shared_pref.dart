import 'dart:convert';

import 'package:bookia/feature/auth/data/model/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences pref;
  static const String kUserData = "userData";
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static saveUserData(UserModel model) {
    //to pares object to map
    var json = model.toJson();

    //to pares map to string use json encode from dart:convert
    var jsonToString = jsonEncode(json);
    saveData(kUserData, jsonToString);
  }

  static UserModel? getUserData() {
    String? stringData = getData(kUserData);
    if (stringData == null) {
      return null;
    }
    //to parse string to map use json decode from dart:convert
    var stringTojson = jsonDecode(stringData);
    //to parse map to object
    return UserModel.fromJson(stringTojson);
  }

  //  setInt(String key, int value) async {
  //  await pref.setInt(key, value);
  //  }
  //  int?getInt(String key){
  //   return pref.getInt(key);
  //  }
  //  setstring(String key, String value) async {
  //  await pref.setString(key, value);
  //  }
  //  String?getstring(String key){
  //   return pref.getString(key);
  //  }
  //  setbool(String key, bool value) async {
  //  await pref.setBool(key, value);
  //  }
  //  bool?getbool(String key){
  //   return pref.getBool(key);
  //  }
  //  setDouble(String key, double value) async {
  //  await pref.setDouble(key, value);
  //  }
  //  double?getDouble(String key){
  //   return pref.getDouble(key);
  //  }
  //  remove (String key) async{
  //   await pref.remove(key);
  //  }
  ///////////////////// بدل ما نعمل دا كله فيه حل اسهل/////////////////////
  static saveData(String key, dynamic value) async {
    if (value is int) {
      await pref.setInt(key, value);
    }
    if (value is String) {
      await pref.setString(key, value);
    }
    if (value is bool) {
      await pref.setBool(key, value);
    }
    if (value is double) {
      await pref.setDouble(key, value);
    }
  }

  static dynamic getData(String key) {
    return pref.get(key);
  }

  static removeData(String key) async {
    await pref.remove(key);
  }
}
