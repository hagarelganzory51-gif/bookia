import 'dart:convert';

import 'package:bookia/feature/auth/data/model/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences pref;
  static const String kUserData = "userData";
  static const String kWishlist = 'wishlist';
  // ignore: strict_top_level_inference
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  // ignore: strict_top_level_inference
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




  // ignore: strict_top_level_inference
  static saveWishlist(List<int> wishlistIds) {
    // list of int بحول  list of string
    List<String> listOfStrings = [];
    for (var id in wishlistIds) {
      listOfStrings.add(id.toString());
    }

    saveData(kWishlist, listOfStrings);
  }




  static List<int>? getWishlist() {
    List<String>? listOfStrings = getData(kWishlist);
    if (listOfStrings == null) return null;
    List<int> listOfInts = [];
    for (var id in listOfStrings) {
      listOfInts.add(int.tryParse(id) ?? 0);
    }
    return listOfInts;
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
  // ignore: strict_top_level_inference
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

  // ignore: strict_top_level_inference
  static removeData(String key) async {
    await pref.remove(key);
  }


  

}
