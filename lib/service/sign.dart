import 'package:dio/dio.dart' as dios;
import 'package:flutter/foundation.dart';
import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/tools/generate_timestamp.dart';
import '../selfwidgets/Toast.dart';

class SignWays {

  final dio = AppNetwork.get().ketangpaiDio;

  Future<bool> scanToSign(String params,String token) async {
    DateTime now = DateTime.now();
    int reqtimestamp = now.millisecondsSinceEpoch ~/ 1000;
    RegExp ticketidRegExp = RegExp(r'ticketid=([^&]*)');
    String ticketid = ticketidRegExp.firstMatch(params)?.group(1) ?? '';
    RegExp expireRegExp = RegExp(r'expire=([^&]*)');
    String expire = expireRegExp.firstMatch(params)?.group(1) ?? '';
    RegExp signRegExp = RegExp(r'sign=([^&]*)');
    String sign = signRegExp.firstMatch(params)?.group(1) ?? '';
    if (kDebugMode) {
      print("expire:" + expire);
      print("ticketid:" + ticketid);
      print("sign:" + sign);
    }
    //从扫码得到的url中获取签到所需要的参数
    Map<String, dynamic> body = {
      'ticketid': ticketid,
      "expire": expire,
      "sign": sign,
      "reqtimestamp": reqtimestamp
    };
    dio.options.headers = {
      'token': token,
    };
    try {
      final response = await dio.post(
        '/AttenceApi/AttenceResult',
        data: body,
      );
      print(response.toString());
      Toast(response.data['data']['info']);
      if (response.data['data']['state'] == 8) {
        return true;
      }
      return false;
    } on Exception catch (e) {
      Toast(e.toString());
      return false;
    }
  }

  Future<bool> numberSign({required String code,required String token,required String signId}) async {
    final timestamp = DateTime.now().toMillisecondsTimestamp();
    Map<String,dynamic> signBody = {
      'reqtimestamp': timestamp,
      'id': signId,
      'code': code,
    };
    dio.options.headers = {
      'token': token,
    };
    try {
      final response = await dio.post('/AttenceApi/checkin',data: signBody);
      if (response.data['code'] == 10000) {
        Toast('签到成功');
        return true;
      } else {
        Toast(response.data['message']);
        return false;
      }
    } on Exception catch (e) {
      Toast('签到失败:$e');
      return false;
    }
  }

  SignWays._create();

  static SignWays? _instance;

  factory SignWays.get() => _instance ??= SignWays._create();

}
