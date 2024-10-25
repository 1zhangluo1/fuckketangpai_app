import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/models/online_courses/online_courses.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/service/get_course.dart';
import 'package:fuckketangpai/service/get_user_by_json.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../tools/sign.dart';
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
    this.signingCourses.forEach((e)=>print(e.coursename));
  }

  Future<String> showSignWay(BuildContext context) async {
    BarcodeCapture result = await Get.to(Scan());
    String url = result.barcodes.first.rawValue.toString();
    return url;
  }

  Future signSelectablePeople(String url) async {
    for (var user in users.where((user) => user.isCheck == true) ) {
      print(user.name);
      bool result = await sign(url, user.token);
      print("签到结果：" + result.toString());
      user.signStatus = result;
    }
    users.forEach((e)=>print("签到结果后的状态：" + e.signStatus.toString()));
    Get.forceAppUpdate();
  }

  @override
  void onInit() async {
    super.onInit();
    refreshUserData();
    refreshCoursesData();
  }

}