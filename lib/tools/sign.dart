import 'package:dio/dio.dart' as dios;
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
  final dio = dios.Dio();
  Map<String, dynamic> body = {
    'ticketid': ticketid,
    "expire": expire,
    "sign": sign,
    "reqtimestamp": reqtimestamp
  };
  dio.options.headers = {
    'Content-Type': 'application/json',
    'token': '3ac938c4773acc9cff1fe0427de0d77c40882f8557ae73d775402834a6980fcf',
  };
  dios.Response response = await dio.post(url, data: body,);
  print(response.toString());
  Toast(response.data['data']['info']);
}