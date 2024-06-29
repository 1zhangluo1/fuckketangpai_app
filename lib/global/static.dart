import 'package:flutter/cupertino.dart';
import 'package:fuckketangpai/models/userInfo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Internet/getUserInfo.dart';

class Global {
  static String ketangpai_login_key = "ktp4567890123456"; // 16-byte key
  static String ketangpai_login_iv = "ktp4567890123456"; // 16-byte IV
  static Rx<User> user = User('','','','','','','').obs; //用户信息
  static bool login = false;
  static Future init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    login = await pref.getBool('login')??false;
    if(login) {
      getUserInf();
    }
  }
}
