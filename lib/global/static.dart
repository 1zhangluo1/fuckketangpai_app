import 'package:flutter/cupertino.dart';
import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/models/userInfo.dart';
import 'package:get/get.dart';
import 'package:pointycastle/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Internet/getUserInfo.dart';


class Global {
  static List<String> tokens = [];
  static String myToken = '';
  static String ketangpai_login_key = "ktp4567890123456"; // 16-byte key
  static String ketangpai_login_iv = "ktp4567890123456"; // 16-byte IV
  static Rx<User> user =
      User('', '', '', '', '', '', '', '', '', "").obs; //用户信息
      // 初始化学期数据
  static bool login = false;
  static Future init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    login = await pref.getBool('login') ?? false;
    await AppNetwork.initNetwork();
    if (login) {
      myToken = await pref.getString('token') ?? '';
      initUserInf(myToken);
    }
  }
}
