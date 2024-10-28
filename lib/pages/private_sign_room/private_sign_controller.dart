import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/models/online_courses/online_courses.dart';
import 'package:fuckketangpai/pages/sign/gps_sign.dart';
import 'package:fuckketangpai/pages/sign/number_sign.dart';
import 'package:fuckketangpai/pages/sign/scan_sign.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/service/get_course.dart';
import 'package:fuckketangpai/service/get_user_by_json.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../service/sign.dart';
import '../sign/scan.dart';

class PrivateSignController extends GetxController {

  RxList<Users> users = <Users>[].obs;

  Future<List<Users>?> get getLocalUsersData async => await getLocalUsersDataByJson();

  RxList<CourseList> signingCourses = <CourseList>[].obs;

  Future refreshUserData() async {
    final userList = await getLocalUsersData;
    if (userList != null) {
      users.clear();
      users.addAll(userList);
      users.firstWhere((e) => e.uid == Global.user.value.uid).isCheck = true;
    }
  }

  Future refreshCoursesData() async {
    final signingCourses = await GetCourseInfo.get().getSigningCourses();
    this.signingCourses.clear();
    this.signingCourses.addAll(signingCourses);
    this.signingCourses.forEach((e)=>print(e.signType));
  }

  Future<String> showSignWay(BuildContext context) async {
    final result = await Get.to(ScanSign());
    String url = result;
    return url;
  }

  Future signSelectablePeople(String url) async {
    for (var user in users.where((user) => user.isCheck == true) ) {
      bool result = await SignWays.get().scanToSign(url, user.token);
      print("签到结果：" + result.toString());
      user.signStatus = result;
    }
    users.forEach((e)=>print("签到结果后的状态：" + e.signStatus.toString()));
  }

  void enterSignRoom(int type,BuildContext context,{String? signId}) async {
    if (type == 1) {
      final signCode = await Get.to<String>(NumberSign());
      print(signCode);
      print(signId);
      if (signCode != null && signCode.isNotEmpty && signId != null) {
        for (var user in users.where((user) => user.isCheck == true) ) {
          bool result = await SignWays.get().numberSign(code: signCode, token: user.token, signId: signId);
          print("${user.name}的签到结果：" + result.toString());
          user.signStatus = result;
        }
      }
    } else if (type == 2) {
      final confirmSignResult = await showDialog<bool>(context: context, builder: (context) => GpsSign());
      if (confirmSignResult != null && signId != null) {
        if (confirmSignResult) {
          for (var user in users.where((user) => user.isCheck == true) ) {
            bool result = await SignWays.get().gpsSign( user.token, signId);
            print("${user.name}的签到结果：" + result.toString());
            user.signStatus = result;
          }
        }
      }
    } else if (type == 3) {
      final signValue = await showSignWay(context);
      if (signValue != '') {
        await signSelectablePeople(signValue);
      }
    } else {
      Toast('错误');
      return;
    }
    Get.forceAppUpdate();
  }

  String mapperSignWay(int num) {
    switch (num) {
      case 1:
        return "数字签到";
      case 2:
        return "GPS签到";
      case 3:
        return "扫码签到";
      default:
        return "异常";
    }
  }

  void selectAllPeople() {
    users.forEach(
        (user) => user.isCheck = true
    );
    Get.forceAppUpdate();
  }

  @override
  void onInit() async {
    super.onInit();
    refreshUserData();
    refreshCoursesData();
  }

}