import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/selfwidgets/sign_ways_select_dialog.dart';
import 'package:get/get.dart';

class PrivateSignController extends GetxController {

  List<Users> users = <Users>[].obs;

  Future getLocalUsersData() async {
    try {
      String contents = await rootBundle.loadString('data/users.json');
      Map<String, dynamic> jsonData = jsonDecode(contents);
      LocalUsers localUsers = LocalUsers.fromJson(jsonData);
      users.addAll(localUsers.users);
      print(users.first.name);
    } catch (e) {
      print('Error: $e');
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
  void onInit() {
    super.onInit();
    getLocalUsersData();
  }

}