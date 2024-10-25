import 'dart:convert';
import 'dart:io';

import '../models/local_users/local_users.dart';
import '../selfwidgets/Toast.dart';
import '../tools/get_document.dart';

Future<int> saveToJson(Users newUser) async {
  final path = await docPath;
  final file = File('$path/users.json');
  if (!await file.exists()) {
    await file.writeAsString('{"users": [], "userNumbers": 0}');
  }
  String jsonString = await file.readAsString();
  Map<String, dynamic> jsonData = jsonDecode(jsonString);
  final userData = LocalUsers.fromJson(jsonData);
  final isExit = userData.users.any((user) => user.uid == newUser.uid);
  if (isExit) {
    return 0;
  };
  userData.users.add(newUser);
  userData.userNumbers = userData.users.length;
  String updatedJsonString = jsonEncode(userData);
  try {
    await file.writeAsString(updatedJsonString);
    return 1;
  } on Exception catch (e) {
    Toast('保存失败：$e');
    return -1;
  }
}