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
  }
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

Future<bool> changeSingleUserInfo(Users user) async {
  var result = false;
  final path = await docPath;
  final file = File('$path/users.json');
  if (!await file.exists()) {
    // 如果文件不存在，直接返回，因为没有用户可以删除
    Toast('用户文件不存在');
  }
  // 读取并解析 JSON 数据
  String jsonString = await file.readAsString();
  Map<String, dynamic> jsonData = jsonDecode(jsonString);
  final userData = LocalUsers.fromJson(jsonData);
  final index = userData.users.indexWhere((updateUser) => user.uid == updateUser.uid);
  if (index == -1) {
    // 没有找到匹配的用户，返回 0 表示更新失败
    Toast('没有此用户');
  }
  // 用 updatedUser 替换找到的用户
  userData.users[index] = user;
  String updatedJsonString = jsonEncode(userData);
  try {
    // 写入更新后的 JSON 数据
    await file.writeAsString(updatedJsonString);
    result = true;
    Toast('更新用户信息成功');
  } on Exception catch (e) {
    Toast('更新失败：$e');
  } finally {
    return result;
  }
}

Future<void> deleteUser(Users user) async {
  final path = await docPath;
  final file = File('$path/users.json');
  if (!await file.exists()) {
    // 如果文件不存在，直接返回，因为没有用户可以删除
    Toast('用户文件不存在');
  }
  // 读取并解析 JSON 数据
  String jsonString = await file.readAsString();
  Map<String, dynamic> jsonData = jsonDecode(jsonString);
  final userData = LocalUsers.fromJson(jsonData);
  // 查找并移除指定 uid 的用户
  final initialLength = userData.users.length;
  userData.users.removeWhere((every) => user.uid == every.uid);
  // 检查是否有用户被删除
  if (userData.users.length == initialLength) {
    Toast('没有找到该用户');
  }
  // 更新用户数量
  userData.userNumbers = userData.users.length;
  String updatedJsonString = jsonEncode(userData);
  try {
    // 写入更新后的 JSON 数据
    await file.writeAsString(updatedJsonString);
    Toast('删除成功');
  } on Exception catch (e) {
    Toast('删除失败：$e');
  }
}
