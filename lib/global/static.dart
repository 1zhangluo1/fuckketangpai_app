import 'package:flutter/cupertino.dart';
import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/models/userInfo.dart';
import 'package:get/get.dart';
import 'package:pointycastle/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Internet/getUserInfo.dart';

class Course {
   String title="null";
   String teacherName='null';
   String courseId="null";
   String courseCode="null";
   String studentCount="0";

  //Course(this.title, this.courseId, this.courseCode, this.studentCount);
}

class Semester {
  String title="";
  String semester="";
    String term="";
  String termTxt="";
  List<Course> courses=<Course>[];
  bool isExpanded=false;
  Semester();
}

class SemesterList {
  var list = <Semester>[].obs;
}

class UserList  {
  var list = <User>[].obs; // 使用 RxList 来存储用户
  

 // UserList(this.list);
}


class Global {
  static List<String> tokens = [];
  static String myToken = '';
  static String ketangpai_login_key = "ktp4567890123456"; // 16-byte key
  static String ketangpai_login_iv = "ktp4567890123456"; // 16-byte IV
  static Rx<User> user =
      User('', '', '', '', '', '', '', '', '', "").obs; //用户信息
      // 初始化学期数据
  static SemesterList semesters = SemesterList();
  static UserList users = UserList(); //用户信息
  static bool login = false;
  static Future init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    login = await pref.getBool('login') ?? false;
    await AppNetwork.initNetwork();
    print(AppNetwork.get().ketangpaiDio.options.baseUrl);
    if (login) {
       getUserInf();
    }
  }
}
