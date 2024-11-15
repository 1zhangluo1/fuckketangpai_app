import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';

class GetUserInfo {

  Future<bool> checkTokenStatus(String token) async {
    int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
    final singleDio = Dio();
    Map<String, int> body = {'reqtimestamp': reqtimestamp};
    singleDio.options.headers = {
      'token': token,
    };
    final response = await singleDio.post('https://openapiv5.ketangpai.com//UserApi/getUserBasinInfo', data: body);
    if (kDebugMode) {
      print(response.data['data']['token']);
    }
    if (response.data['data']['token'] == null) {
      return false;
    }
    return true;
  }

  GetUserInfo._create();

  static GetUserInfo? _instance;

  factory GetUserInfo.get() => GetUserInfo._instance ??= GetUserInfo._create();

}