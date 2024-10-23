import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/selfwidgets/sign_ways_select_dialog.dart';
import 'package:fuckketangpai/service/get_user_by_json.dart';
import 'package:get/get.dart';

class PrivateSignController extends GetxController {

  List<Users> users = <Users>[].obs;

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

  @override
  void onInit() async {
    super.onInit();
    final userList = await getLocalUsersData;
    if (userList != null) {
      users.addAll(userList);
    }
  }

}