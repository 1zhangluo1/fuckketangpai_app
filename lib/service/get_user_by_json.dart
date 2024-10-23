import 'dart:convert';
import 'dart:io';

import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/tools/get_document.dart';

import '../models/local_users/local_users.dart';

Future<List<Users>?> getLocalUsersDataByJson() async {
  try {
    String path = await docPath;
    final file = File('$path/users.json');
    if (!await file.exists()) {
      Toast('用户文件不存在');
      return null;
    }
    final jsonString = await file.readAsString();
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    LocalUsers localUsers = LocalUsers.fromJson(jsonData);
    return localUsers.users;
  } catch (e) {
    Toast('Error: $e');
    return null;
  }
}