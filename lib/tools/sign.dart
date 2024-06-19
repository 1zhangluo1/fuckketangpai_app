import 'package:dio/dio.dart' as dios;
import 'package:shared_preferences/shared_preferences.dart';
import '../selfwidgets/Toast.dart';

Future<void> sign(String params) async {
  String url = 'https://openapiv5.ketangpai.com/AttenceApi/AttenceResult';
  DateTime now = DateTime.now();
  int reqtimestamp = now.millisecondsSinceEpoch ~/ 1000;
  print("timestamp:" + reqtimestamp.toString());
  RegExp ticketidRegExp = RegExp(r'ticketid=([^&]*)');
  String ticketid = ticketidRegExp.firstMatch(params)?.group(1) ?? '';
  RegExp expireRegExp = RegExp(r'expire=([^&]*)');
  String expire = expireRegExp.firstMatch(params)?.group(1) ?? '';
  RegExp signRegExp = RegExp(r'sign=([^&]*)');
  String sign = signRegExp.firstMatch(params)?.group(1) ?? '';
  print("expire:" + expire);
  print("ticketid:" + ticketid);
  print("sign:" + sign);
  Map<String, dynamic> body = {
    'ticketid': ticketid,
    "expire": expire,
    "sign": sign,
    "reqtimestamp": reqtimestamp
  };
  try {
    final dio = dios.Dio();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = await pref.getString('token')??'';
    dio.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
    };
    dios.Response response = await dio.post(url, data: body,);
    print(response.toString());
    Toast(response.data['data']['info']);
  } on Exception catch (e) {
    Toast(e.toString());
  }
}