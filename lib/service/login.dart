import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../global/static.dart';
import '../selfwidgets/Toast.dart';
import '../tools/encrypt_loginpass.dart';

class Login {
  final dio = Dio();

  Future<String> login(
      {required String account,
      String password = '',
      String verifyCode = '',
      required String url}) async {
    var token = '';
    String encryPass = encryptByCBC(
        password, Global.ketangpai_login_key, Global.ketangpai_login_iv);
    int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
    Map<String, dynamic> loginBody = {
      'mobile': account,
      'password': encryPass,
      'encryption': '1',
      'reqtimestamp': reqtimestamp,
      'email': account,
      'type': 'login',
      'remember': '0',
      'code': verifyCode,
    };
    try {
      final response = await dio.post(url, data: loginBody);
      if (response.data['status'] == 1) {
        token = response.data['data']['token'];
      } else if (response.data['message'].toString().contains('密码错误')) {
        token = '密码错误';
      } else {
        if (kDebugMode) {
          print(response.data.toString());
        }
        Toast('登录失败');
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('登录失败：$e');
      }
      Toast('登录失败：$e');
    } finally {
      return token;
    }
  }

  Login._create();

  static Login? _instance;

  factory Login.get() => Login._instance ??= Login._create();
}
