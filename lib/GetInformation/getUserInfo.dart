import 'package:dio/dio.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/getUserInfos/getUserInfos.dart';
import 'package:fuckketangpai/models/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getUserInf() async {
  String url = 'https://openapiv5.ketangpai.com//UserApi/getUserBasinInfo';
  int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
  Map<String, int> body = {'reqtimestamp': reqtimestamp};
  Dio dio = Dio();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = await pref.getString('token') ?? '';
  dio.options.headers = {
    'token': token,
  };
  Response response = await dio.post(url, data: body);
  dynamic temp = response.data;
  GetUserInfos info = GetUserInfos.fromJson(temp);
  Global.user.value = User(
    info.data.username,
    info.data.stno,
    info.data.uid,
    info.data.avatar,
    info.data.mobile,
    info.data.school,
    info.data.usertype,
  );
}
