import 'package:dio/dio.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/getUserInfos/getUserInfos.dart';
import 'package:fuckketangpai/models/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getUserInf() async {
  String url1 = 'https://openapiv5.ketangpai.com//UserApi/getUserBasinInfo';
  String url2 = 'https://openapiv5.ketangpai.com//UserApi/getUserInfo';
  int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
  Map<String, int> body = {'reqtimestamp': reqtimestamp};
  Dio dio = Dio();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = await pref.getString('token') ?? '';
  dio.options.headers = {
    'token': token,
  };
  Response response1 = await dio.post(url2, data: body);
  Response response2 = await dio.post(url1,data: body);
  dynamic temp = response1.data;
  GetUserInfos info = GetUserInfos.fromJson(temp);
  Global.user.value = User(
    info.data.username,
    info.data.stno,
    info.data.uid,
    info.data.avatar,
    response2.data['data']['mobile'],
    info.data.school,
    info.data.usertype,
    info.data.additionInfo.grade,
    info.data.additionInfo.enrolltime,
  );
  print(Global.user.value.toString());
}
