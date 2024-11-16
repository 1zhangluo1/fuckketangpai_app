import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/service/edit_user_to_json.dart';
import 'package:fuckketangpai/service/login.dart';

class CheckUserStatus {

  final dio = Dio();

  Future<bool> checkTokenStatus(String token) async {
    int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
    Map<String, int> body = {'reqtimestamp': reqtimestamp};
    dio.options.headers = {
      'token': token,
    };
    final response = await dio.post('https://openapiv5.ketangpai.com//UserApi/getUserBasinInfo', data: body);
    if (kDebugMode) {
      print(response.data['data']['token']);
    }
    if (response.data['data']['token'] == null) {
      return false;
    }
    return true;
  }

  Future<bool> updateUserToken(Users user) async {
    final newToken = await Login.get().login(account: user.account, password: user.password, url: 'https://openapiv5.ketangpai.com//UserApi/login');
    if (newToken != '' && newToken != '密码错误') {
      user.token = newToken;
      final result = await changeSingleUserInfo(user);
      if (result) return true;
      else return false;
    } else if (newToken == '密码错误') {
      Toast('${user.name}的密码错误，请更新用户信息');
      return false;
    } else {
      Toast('更新过期用户信息失败');
      return false;
    }
  }

  CheckUserStatus._create();

  static CheckUserStatus? _instance;

  factory CheckUserStatus.get() => CheckUserStatus._instance ??= CheckUserStatus._create();

}