import 'package:dio/dio.dart';
import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/getUserInfos/getUserInfos.dart';
import 'package:fuckketangpai/models/userInfo.dart';
import 'package:fuckketangpai/pages/sign/scan.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initUserInf(String token) async {
  String url1 = 'https://openapiv5.ketangpai.com//UserApi/getUserBasinInfo';
  String url2 = 'https://openapiv5.ketangpai.com//UserApi/getUserInfo';
  int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
  Map<String, int> body = {'reqtimestamp': reqtimestamp};
  final dio = AppNetwork.get().ketangpaiDio;
  dio.options.headers = {
    'token': token,
  };
  Response response1 = await dio.post(url1, data: body);
  Response response2 = await dio.post(url2, data: body);
  dynamic temp = response2.data;
  GetUserInfos info = GetUserInfos.fromJson(temp);
  final uid = response1.data['data']['uid'];
  Global.user.value = User(
    info.data.username,
    info.data.stno,
    uid,
    info.data.avatar,
    response1.data['data']['mobile'] ?? "无",
    info.data.school,
    info.data.usertype,
    info.data.additionInfo.grade,
    info.data.additionInfo.enrolltime,
    "",
  );
}

Future<User> getUserInfByToken(String token) async {
  String url1 = 'https://openapiv5.ketangpai.com//UserApi/getUserBasinInfo';
  String url2 = 'https://openapiv5.ketangpai.com//UserApi/getUserInfo';
  int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
  Map<String, int> body = {'reqtimestamp': reqtimestamp};
  final dio = AppNetwork.get().ketangpaiDio;
  dio.options.headers = {
    'token': token,
  };
  Response response1 = await dio.post(url1, data: body);
  Response response2 = await dio.post(url2, data: body);
  dynamic temp = response2.data;
  final uid = response1.data['data']['uid'];
  GetUserInfos info = GetUserInfos.fromJson(temp);
  var user = User(
    info.data.username,
    info.data.stno,
    uid,
    info.data.avatar,
    response1.data['data']['mobile'] ?? "无",
    info.data.school,
    info.data.usertype,
    info.data.additionInfo.grade,
    info.data.additionInfo.enrolltime,
    "",
  );
  return user;
}