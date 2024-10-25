import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/selfwidgets/sign_ways_select_dialog.dart';
import 'package:fuckketangpai/service/get_user_by_json.dart';
import 'package:get/get.dart';

import '../../tools/sign.dart';

class PrivateSignController extends GetxController {

  RxList<Users> users = <Users>[].obs;

  Future<List<Users>?> get getLocalUsersData async => await getLocalUsersDataByJson();

  Future refreshData() async {
    final userList = await getLocalUsersData;
    if (userList != null) {
      users.clear();
      users.addAll(userList);
    }
  }

  Future<String> showSignWay(BuildContext context) async {
    final signValue = await showDialog<String>(
        context: context,
        builder: (context) {
          return SignWaysSelectDialog();
        }
    );
    return signValue ?? '';
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
    final userList = await getLocalUsersData;
    if (userList != null) {
      users.addAll(userList);
    }
    users.firstWhere((e) => e.uid == Global.user.value.uid).isCheck = true;
  }

}