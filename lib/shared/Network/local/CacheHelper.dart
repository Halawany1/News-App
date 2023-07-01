import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPreferences;
  static Future<void> init() async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool> PutBoolean({required String key,required bool value})
  async{
    return await sharedPreferences.setBool(key,value);
  }
  static bool getBoolean({required String key}) {
   return  sharedPreferences.getBool(key) ?? false;
  }
}