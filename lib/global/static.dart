import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
  static Map<String, Style> htmlStyle = {
    "html": Style(
      margin: Margins.all(0), // 全局外边距
      padding: HtmlPaddings.all(0), // 全局内边距
    ),
    "h1": Style(fontSize: FontSize(24)), // 调整标题大小
    "p": Style(fontSize: FontSize(18)), // 调整段落大小
    "a": Style(fontSize: FontSize(14), color: Colors.blue), // 调整链接大小
  };
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
