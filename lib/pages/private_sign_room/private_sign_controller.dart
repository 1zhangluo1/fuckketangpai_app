import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fuckketangpai/main.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/pages/sign/gps_sign.dart';
import 'package:fuckketangpai/pages/sign/number_sign.dart';
import 'package:fuckketangpai/pages/sign/scan_sign.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/selfwidgets/users_list.dart';
import 'package:fuckketangpai/service/get_course.dart';
import 'package:fuckketangpai/service/get_user_by_json.dart';
import 'package:fuckketangpai/service/check_user_status.dart';
import 'package:fuckketangpai/tools/uitils.dart';
import 'package:get/get.dart';
import '../../global/static.dart';
import '../../models/courses_list/courses_list.dart';
import '../../selfwidgets/loading_dialog.dart';
import '../../service/edit_user_to_json.dart';
import '../../service/sign.dart';

class PrivateSignController extends GetxController {

  RxList<Users> users = <Users>[].obs;

  Future<List<Users>?> get getLocalUsersData async => await getLocalUsersDataByJson();

  RxList<Course> signingCourses = <Course>[].obs;

  RxList<Users> invalidUsers = <Users>[].obs;

  Future refreshUserData() async {
    final userList = await getLocalUsersData;
    if (userList != null) {
      users.clear();
      users.addAll(userList);
      users.firstWhere((e) => e.uid == Global.user.value.uid,orElse: null).isCheck = true;
    }
    await Future.wait(users.map((user) async {
      final status = await CheckUserStatus.get().checkTokenStatus(user.token);
      user.tokenStatus = status;
    }));
    invalidUsers.value = users.where((user) => user.tokenStatus == false).toList();
    Get.forceAppUpdate();
  }

  Future updateInvalidUserInfo() async {
    await Future.wait(invalidUsers.map((user) async {
      if (user.password != '') {
        final result = await CheckUserStatus.get().updateUserToken(user);
        if (result) {
          user.tokenStatus = true;
        }
      }
    }));
    invalidUsers.value = users.where((user) => user.tokenStatus == false).toList();
    Get.forceAppUpdate();
  }

  void listInvalidUser() {
    final context = navigatorKey.currentContext;
    if (kDebugMode) {
      print(invalidUsers.length);
      invalidUsers.forEach((e) => print(e.toString()));
    }
    if (invalidUsers.isNotEmpty && context != null) {
      showDialog(context: context, builder: (context) => UsersList(users: invalidUsers), barrierDismissible: false);
    }
  }

  Future<void> refreshCoursesData() async {
    final signingCourses = await GetCourseInfo.get().getSigningCourses();
    this.signingCourses.clear();
    this.signingCourses.addAll(signingCourses);
  }

  Future<bool> checkUserAccountStatus(String token) async {
    final status = await CheckUserStatus.get().checkTokenStatus(token);
    return status;
  }

  Future<String> showSignWay(BuildContext context) async {
    final result = await Get.to(ScanSign());
    String url = result;
    return url;
  }

  Future signSelectablePeople(String url) async {
    List<Future<void>> tasks = users
        .where((user) => user.isCheck == true)
        .map((user) async {
      bool result = await SignWays.get().scanToSign(url, user.token);
      if (kDebugMode) {
        print("${user.name}的签到结果：" + result.toString());
      }
      user.signStatus = result;
    }).toList();
    await Future.wait(tasks);
  }

  void enterSignRoom(int type,BuildContext context,{String? signId}) async {
    if (type == 1) {
      final signCode = await Get.to<String>(NumberSign());
      if (signCode != null && signCode.isNotEmpty && signId != null) {
        List<Future<void>> tasks = users
            .where((user) => user.isCheck == true)
            .map((user) async {
          bool result = await SignWays.get().numberSign(code: signCode, token: user.token, signId: signId);
          if (kDebugMode) {
            print("${user.name}的签到结果：" + result.toString());
          }
          user.signStatus = result;
        }).toList();
        await Future.wait(tasks);
        Get.forceAppUpdate();
      }
    } else if (type == 2) {
      final confirmSignResult = await showDialog<bool>(context: context, builder: (context) => GpsSign());
      if (confirmSignResult != null && signId != null) {
        if (confirmSignResult) {
          List<Future<void>> tasks = users
              .where((user) => user.isCheck == true)
              .map((user) async {
            bool result = await SignWays.get().gpsSign(user.token, signId);
            if (kDebugMode) {
              print("${user.name}的签到结果：" + result.toString());
            }
            user.signStatus = result;
          }).toList();
          await Future.wait(tasks);
          Get.forceAppUpdate();
        }
      }
    } else if (type == 3) {
      final signValue = await showSignWay(context);
      if (signValue != '') {
        await signSelectablePeople(signValue);
        Get.forceAppUpdate();
      }
    } else {
      Toast('错误');
      return;
    }
    Get.forceAppUpdate();
  }

  void selectAllPeople() {
    users.forEach(
        (user) => user.isCheck = true
    );
    Get.forceAppUpdate();
  }

  Future<void> deleteSelectedUser(Users user,BuildContext context) async {
    LoadingDialog.showLoadingDialog(context: context, hintText: '删除中...');
    await deleteUser(user);
    await refreshUserData();
    LoadingDialog.hideDialog(context: context);
  }

  @override
  void onInit() async {
    super.onInit();
    await Future.wait([
    refreshUserData(),
    refreshCoursesData()
    ]);
    await updateInvalidUserInfo();
    listInvalidUser();
  }

}